return {
  -- dart syntax + formatting
  {
    "dart-lang/dart-vim-plugin",
    init = function()
      vim.g.dart_style_guide = 2
      vim.g.dart_format_on_save = 1
      vim.g.dart_trailing_comma_indent = true
    end,
  },

  -- DAP
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",
      {
        "rcarriga/nvim-dap-ui",
        config = function()
          local dap, dapui = require("dap"), require("dapui")
          dapui.setup({
            layouts = {
              {
                elements = {
                  { id = "scopes", size = 0.25 },
                  { id = "breakpoints", size = 0.25 },
                  { id = "stacks", size = 0.25 },
                  { id = "watches", size = 0.25 },
                },
                size = 10,
                position = "bottom",
              },
            },
          })
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
          end

          vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint" })
          vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DapBreakpointCondition" })
          vim.fn.sign_define("DapLogPoint", { text = "◇", texthl = "DapLogPoint" })
        end,
      },
    },
    keys = {
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Condition: "))
        end,
        desc = "Conditional Breakpoint",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<leader>du",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>dr",
        function()
          require("dap").restart()
        end,
        desc = "Restart",
      },
      {
        "<leader>ds",
        function()
          require("dap").terminate()
        end,
        desc = "Stop",
      },
      {
        "<leader>dt",
        function()
          require("dapui").toggle()
        end,
        desc = "Toggle DAP UI",
      },
    },
  },

  -- Flutter
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup({
        ui = { border = "rounded" },
        closing_tags = { enabled = true },
        widget_guides = { enabled = true },
        dev_log = { enabled = true, notify_errors = true },
        flutter_path = nil, -- auto-detected from $PATH
        lsp = {
          color = { enabled = true },
          capabilities = require("blink.cmp").get_lsp_capabilities(),
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            updateImportsOnRename = true,
            renameFilesWithClasses = "prompt",
            enableSnippets = false,
            analysisExcludedFolders = {
              vim.fn.expand("$HOME/.pub-cache"),
              vim.fn.expand("$FLUTTER_ROOT/packages"),
              vim.fn.expand("$FLUTTER_ROOT/bin/cache"),
            },
          },
        },
        debugger = {
          enabled = true,
          run_via_dap = true,
          exception_breakpoints = {},
          register_configurations = function(_)
            require("dap").adapters.dart = {
              type = "executable",
              command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
              args = { "flutter" },
            }
            require("dap").configurations.dart = {
              {
                type = "dart",
                request = "launch",
                name = "Launch Flutter",
                dartSdkPath = vim.fn.expand("$FLUTTER_ROOT") .. "/bin/cache/dart-sdk",
                flutterSdkPath = vim.fn.expand("$FLUTTER_ROOT"),
                program = "${workspaceFolder}/lib/main.dart",
                cwd = "${workspaceFolder}",
              },
            }
          end,
        },
      })

      local map = vim.keymap.set
      map("n", "<leader>Fr", "<cmd>FlutterRun<CR>", { desc = "Flutter Run" })
      map("n", "<leader>Fq", "<cmd>FlutterQuit<CR>", { desc = "Flutter Quit" })
      map("n", "<leader>FR", "<cmd>FlutterRestart<CR>", { desc = "Flutter Restart" })
      map("n", "<leader>Fh", "<cmd>FlutterReload<CR>", { desc = "Flutter Hot Reload" })
      map("n", "<leader>Fd", "<cmd>FlutterDevices<CR>", { desc = "Flutter Devices" })
      map("n", "<leader>FD", "<cmd>FlutterDevTools<CR>", { desc = "Flutter DevTools" })
      map("n", "<leader>Fo", "<cmd>FlutterOutlineToggle<CR>", { desc = "Flutter Outline" })
      map("n", "<leader>Fl", "<cmd>FlutterLspRestart<CR>", { desc = "Flutter LSP Restart" })
    end,
  },
}
