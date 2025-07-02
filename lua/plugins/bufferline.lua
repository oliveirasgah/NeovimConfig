return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        separator_style = "slope",
        always_show_bufferline = false,
        offsets = {
          {
            filetype = "neo-tree",
            text = "neo-tree",
            separator = true,
            text_align = "center",
            highlight = "Directory",
          },
        },
      },
    },
  },
}
