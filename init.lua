-- Disable default plugin for file browsing
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Adding imports
require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.treesitter")
require("user.filetypes")
require("user.indentline")
require("user.dressing")
require("user.colorscheme")
require("user.cmp")
require("user.noice")
require("user.lsp")
require("user.telescope")
require("user.neo-tree")
require("user.autopairs")
require("user.comment")
require("user.gitsigns")
require("user.bufferline")
require("user.lualine")
require("user.toggleterm")
