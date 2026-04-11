vim.pack.add(
    {
        "https://github.com/nvim-neotest/nvim-nio",
        "https://github.com/Civitasv/cmake-tools.nvim",
        "https://github.com/mfussenegger/nvim-dap-python",
        "https://github.com/theHamsta/nvim-dap-virtual-text",
        "https://github.com/rcarriga/nvim-dap-ui",
        "https://github.com/mfussenegger/nvim-dap",
    }
)

        require("dapui").setup()
        local dap, dapui = require("dap"), require("dapui")
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.disconnect.dapui_config = function()
            dapui.close()
        end

        local cmake = require("cmake-tools")

        dap.adapters.cpp = {
            type = "server",
            port = "${port}",
            executable = {
                command = "codelldb",
                args = { "--port", "${port}" },
            }
        }
        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "cpp",
                request = "launch",
                program = function()
                    return cmake.get_launch_target_path()
                    -- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = cmake.get_launch_target_directory,
                stopOnEntry = false,
                args = {},
                runInTerminal = true,
                console = "externalTerminal"
            },
        }

vim.keymap.set("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "Breakpoint Condition" })

vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })

vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "Run/Continue" })

vim.keymap.set("n", "<leader>dC", function() dap.run_to_cursor() end, { desc = "Run to Cursor" })

vim.keymap.set("n", "<leader>dg", function() dap.goto_() end, { desc = "Go to Line (No Execute)" })

vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = "Step Into" })

vim.keymap.set("n", "<leader>dj", function() dap.down() end, { desc = "Down" })

vim.keymap.set("n", "<leader>dk", function() dap.up() end, { desc = "Up" })

vim.keymap.set("n", "<leader>dl", function() dap.run_last() end, { desc = "Run Last" })

vim.keymap.set("n", "<leader>do", function() dap.step_out() end, { desc = "Step Out" })

vim.keymap.set("n", "<leader>dO", function() dap.step_over() end, { desc = "Step Over" })

vim.keymap.set("n", "<leader>dP", function() dap.pause() end, { desc = "Pause" })

vim.keymap.set("n", "<leader>dr", function() dap.repl.toggle() end, { desc = "Toggle REPL" })

vim.keymap.set("n", "<leader>ds", function() dap.session() end, { desc = "Session" })

vim.keymap.set("n", "<leader>dt", function() dap.terminate() end, { desc = "Terminate" })

vim.keymap.set("n", "<leader>dw", function() widgets.hover() end, { desc = "Widgets" })
