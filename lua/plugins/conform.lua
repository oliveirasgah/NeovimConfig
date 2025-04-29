return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        html = { "htmlbeautifier" },
        javascript = { "prettier" },
      },
    },
  },
}
