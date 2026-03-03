return {
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      ui = { border = "rounded" },
      closing_tags = { enabled = true },
      widget_guides = { enabled = true },
      dev_log = { enabled = true, notify_errors = true },
      flutter_path = nil,
      lsp = {
        color = { enabled = true },
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
    },
    keys = {
      { "<leader>Fr", "<cmd>FlutterRun<CR>", desc = "Flutter Run" },
      { "<leader>Fq", "<cmd>FlutterQuit<CR>", desc = "Flutter Quit" },
      { "<leader>FR", "<cmd>FlutterRestart<CR>", desc = "Flutter Restart" },
      { "<leader>Fh", "<cmd>FlutterReload<CR>", desc = "Flutter Hot Reload" },
      { "<leader>Fd", "<cmd>FlutterDevices<CR>", desc = "Flutter Devices" },
      { "<leader>FD", "<cmd>FlutterDevTools<CR>", desc = "Flutter DevTools" },
      { "<leader>Fo", "<cmd>FlutterOutlineToggle<CR>", desc = "Flutter Outline" },
      { "<leader>Fl", "<cmd>FlutterLspRestart<CR>", desc = "Flutter LSP Restart" },
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      if type(opts) == "function" then
        opts = opts()
      end
      if type(opts) == "table" then
        for k, v in pairs(opts) do
          require("dap")[k] = v
        end
      end
    end,
  },
  {
    "dart-lang/dart-vim-plugin",
    init = function()
      vim.g.dart_style_guide = 2
      vim.g.dart_format_on_save = 1
      vim.g.dart_trailing_comma_indent = true
    end,
  },
}
