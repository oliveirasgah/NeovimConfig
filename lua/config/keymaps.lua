local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Neo-tree
keymap("n", "<leader>e", ":Neotree toggle<CR>", opts)

-- Place searches in center
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Telescope
keymap(
  "n",
  "<leader>ff",
  "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>",
  opts
)

keymap(
  "n",
  "<leader>fv",
  "<cmd>lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>",
  opts
)
keymap(
  "n",
  "<leader>fh",
  "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ previewer = false , hidden = true }))<CR>",
  opts
)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)

-- Gitsigns --
keymap("n", "<leader>vb", ":Gitsigns blame_line<CR>")
keymap("n", "<leader>vp", ":Gitsigns preview_hunk<CR>")

-- Paste text only yanked, not removed
keymap("x", "<leader>p", '"_dP', opts)

-- Format code
keymap("n", "<leader>F", function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  })
end, { unpack(opts), desc = "Format file" })

-- Lazy menu
keymap("n", "<leader>ll", "<cmd>Lazy<CR>", { unpack(opts), desc = "Lazy" })
vim.keymap.del("n", "<leader>l") -- It will be used for line actions

-- Keymaps for LSP
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { unpack(opts), desc = "See diagnostic" })
keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { unpack(opts), desc = "Code actions" })
keymap(
  "n",
  "<leader>lj",
  "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>",
  { unpack(opts), desc = "Goto next diagnostic" }
)
keymap(
  "n",
  "<leader>lk",
  "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
  { unpack(opts), desc = "Goto previous diagnostic" }
)
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", { unpack(opts), desc = "Rename" })
keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { unpack(opts), desc = "Signature help" })
keymap(
  "n",
  "<leader>lq",
  "<cmd>lua vim.diagnostic.setloclist()<CR>",
  { unpack(opts), desc = "See diagnostics in file" }
)
