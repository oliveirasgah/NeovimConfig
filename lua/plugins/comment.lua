return {
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    keys = {
      { "<C-/>", false },
      { "<C-/>", "gcc", mode = "n", remap = true },
      { "<C-/>", "gc", mode = "v", remap = true },
    },
    opts = function()
      local context_comment = require("ts_context_commentstring")
      local context_integration = require("ts_context_commentstring.integrations.comment_nvim")

      context_comment.setup({
        enable_autocmd = false,
      })

      return {
        padding = true,
        sticky = true,
        ignore = nil,
        toggler = {
          line = "gcc",
          block = "gbc",
        },
        opleader = {
          line = "gc",
          block = "gb",
        },
        extra = {
          above = "gcO",
          below = "gco",
          eol = "gcA",
        },
        mappings = {
          basic = true,
          extra = true,
        },
        pre_hook = context_integration.create_pre_hook(),
        post_hook = nil,
      }
    end,
  },
}
