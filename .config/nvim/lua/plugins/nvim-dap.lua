return {
    "mfussenegger/nvim-dap",
    recommended = true,
    dependencies = {
        "nvim-neotest/nvim-nio",
        "Civitasv/cmake-tools.nvim",
        "leoluz/nvim-dap-go",
        "rcarriga/nvim-dap-ui",
        "mfussenegger/nvim-dap-python",
        -- virtual text for the debugger
        {
            "theHamsta/nvim-dap-virtual-text",
            opts = {},
        },
    },

    config = function()
        require("dap-go").setup()
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

        dap.adapters.go = {
            type = "executable",
            command = "node",
            args = { os.getenv("HOME") .. "/github/vscode-go/extension/dist/debugAdapter.js" },
        }
        dap.configurations.go = {
            {
                type = "go",
                name = "Debug",
                request = "launch",
                showLog = false,
                program = "${workspaceFolder}/main.go",
                args = require("dap-go").get_arguments,
                dlvToolPath = vim.fn.exepath("dlv"),
            },
        }
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
    end,

    keys = {
        {
            "<leader>dB",
            function()
                require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end,
            desc = "Breakpoint Condition",
        },
        {
            "<leader>db",
            function()
                require("dap").toggle_breakpoint()
            end,
            desc = "Toggle Breakpoint",
        },
        {
            "<leader>dc",
            function()
                require("dap").continue()
            end,
            desc = "Run/Continue",
        },
        {
            "<leader>dC",
            function()
                require("dap").run_to_cursor()
            end,
            desc = "Run to Cursor",
        },
        {
            "<leader>dg",
            function()
                require("dap").goto_()
            end,
            desc = "Go to Line (No Execute)",
        },
        {
            "<leader>di",
            function()
                require("dap").step_into()
            end,
            desc = "Step Into",
        },
        {
            "<leader>dj",
            function()
                require("dap").down()
            end,
            desc = "Down",
        },
        {
            "<leader>dk",
            function()
                require("dap").up()
            end,
            desc = "Up",
        },
        {
            "<leader>dl",
            function()
                require("dap").run_last()
            end,
            desc = "Run Last",
        },
        {
            "<leader>do",
            function()
                require("dap").step_out()
            end,
            desc = "Step Out",
        },
        {
            "<leader>dO",
            function()
                require("dap").step_over()
            end,
            desc = "Step Over",
        },
        {
            "<leader>dP",
            function()
                require("dap").pause()
            end,
            desc = "Pause",
        },
        {
            "<leader>dr",
            function()
                require("dap").repl.toggle()
            end,
            desc = "Toggle REPL",
        },
        {
            "<leader>ds",
            function()
                require("dap").session()
            end,
            desc = "Session",
        },
        {
            "<leader>dt",
            function()
                require("dap").terminate()
            end,
            desc = "Terminate",
        },
        {
            "<leader>dw",
            function()
                require("dap.ui.widgets").hover()
            end,
            desc = "Widgets",
        },
    },
}
