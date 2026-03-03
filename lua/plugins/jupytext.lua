return {
  {
    "goerz/jupytext.nvim",
    opts = function()
      local jupytext = require("jupytext")

      return {
        jupytext = "jupytext",
        format = "py:percent",
        update = true,
        filetype = jupytext.get_filetype,
        new_template = jupytext.default_new_template(),
        sync_patterns = { "*.md", "*.py", "*.jl", "*.R", "*.Rmd", "*.qmd" },
        autosync = true,
        handle_url_schemes = true,
      }
    end,
  },
}
