local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.keymap.set

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal mode --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize window with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate between buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move line up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Move in page blocks
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Place searches in center
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Open file browser
keymap("n", "<leader>e", ":Neotree toggle<CR>", opts)

-- Cursor stay in place after moving line
keymap("n", "J", "mzJ`z", opts)

-- Replace in current word
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)

-- Close current buffer
keymap("n", "<leader>bd", ":bdelete<CR>", opts)

-- Format code
keymap("n", "<leader>F", function()
    require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    })
end, opts)

-- Insert mode --
-- Press jk fast to exti insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual mode --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Move selection up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Paste text only yanked, not removed
keymap("x", "<leader>p", '"_dP', opts)

-- Move selection block up and down
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Terminal mode --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope --
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
