local servers = {
  "cssls",
  "html",
  "emmet_ls",
  "lua_ls",
  "htmx",
}

local tools = {
  "dart-debug-adapter",
}

return {
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = tools },
  },
  {
    "mason-org/mason-lspconfig.nvim",
      priority = 900,
      dependencies = {
        "neovim/nvim-lspconfig",
      },
      opts = {
        ensure_installed = servers,
        automatic_installation = true,
      },
      config = function()
        local opts = {}

        for _, server in pairs(servers) do
          opts = {
            capabilities = require("plugins.lsp.handlers").capabilities,
          }

          server = vim.split(server, "@")[1]

          local require_ok, conf_opts = pcall(require, "plugins.lsp.settings." .. server)

          if require_ok then
            opts = vim.tbl_deep_extend("force", conf_opts, opts)
          end

          vim.lsp.config(server, opts)
        end
      end,
  },
}
