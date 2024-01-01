local dap = require("dap")
require("dap-vscode-js").setup({
    -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
    -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
    -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
    debugger_path = '/Users/vlect/vscode-js-debug',
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
    -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
    -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
    -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

vim.keymap.set('n', '<leader>c', function() dap.continue() end)
vim.keymap.set('n', "<C-'>", function() dap.step_over() end)
vim.keymap.set('n', "<C-;>", function() dap.step_into() end)
vim.keymap.set('n', "<C-:>", function() dap.step_out() end)
vim.keymap.set('n', '<leader>d', function() dap.toggle_breakpoint() end)

for _, language in ipairs({ "typescript", "javascript", "svelte" }) do
    require("dap").configurations[language] = {
        -- attach to a node process that has been started with
        -- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
        -- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
        {
            -- use nvim-dap-vscode-js's pwa-node debug adapter
            type = "pwa-node",
            -- attach to an already running node process with --inspect flag
            -- default port: 9222
            request = "attach",
            -- allows us to pick the process using a picker
            processId = require 'dap.utils'.pick_process,
            -- name of the debug action you have to select for this config
            name = "Attach debugger to existing `node --inspect` process",
            -- for compiled languages like TypeScript or Svelte.js
            sourceMaps = true,
            -- resolve source maps in nested locations while ignoring node_modules
            resolveSourceMapLocations = {
                "${workspaceFolder}/**",
                "!**/node_modules/**" },
            -- path to src in vite based projects (and most other projects as well)
            cwd = "${workspaceFolder}/src",
            -- we don't want to debug code inside node_modules, so skip it!
            skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
        },
        {
            type = "pwa-chrome",
            name = "Launch Chrome to debug client",
            request = "launch",
            url = "http://localhost:5173",
            sourceMaps = true,
            protocol = "inspector",
            port = 9222,
            webRoot = "${workspaceFolder}/src",
            -- skip files from vite's hmr
            skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
        },
        {
            type = "pwa-node",
            request = "launch",
            name = "Debug NestJS",
            runtimeExecutable = "npm",
            runtimeArgs = { "run", "start:debug" }, -- Make sure this matches your package.json script
            cwd = "${workspaceFolder}", -- Adjust as necessary to the root of your project
            sourceMaps = true,
            protocol = "inspector",
            port = 9229, -- This should match the port in your npm script
        },
        -- only if language is javascript, offer this debug action
        language == "typescript" and {
            -- use nvim-dap-vscode-js's pwa-node debug adapter
            type = "pwa-node",
            -- launch a new process to attach the debugger to
            request = "launch",
            -- name of the debug action you have to select for this config
            name = "Launch file in new node process",
            -- launch current file
            program = "${file}",
            cwd = "${workspaceFolder}",
        } or nil,
    }
end

require("dapui").setup()
local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({ reset = true })
end
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close
