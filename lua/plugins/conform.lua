return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      formatters = {
        sql_formatter = {
          command = "sql-formatter",
          args = {
            "--language",
            "postgresql",
            "--config",
            '{"keywordCase":"upper","dataTypeCase":"upper","functionCase":"upper","tabWidth":2}',
          },
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        html = { "htmlbeautifier" },
        javascript = { "prettier" },
        sql = { "sql_formatter" },
      },
    },
  },
}
