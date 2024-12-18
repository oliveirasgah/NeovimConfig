local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })

    print("Installing Packer. Close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand to reload Neovim when plugins.lua is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Get packer in protected call
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Packer in popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Installing plugins
return packer.startup(function(use)
    use("wbthomason/packer.nvim")      -- Packer manage itself
    use("nvim-lua/plenary.nvim")       -- Useful functions in Lua
    use("nvim-tree/nvim-web-devicons") -- Icons for multiple plugins

    -- Colorschemes
    use("catppuccin/nvim")

    -- Cmp
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")

    -- Snippets
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")

    -- LSP
    use("neovim/nvim-lspconfig")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")

    -- Telescope
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-media-files.nvim")

    -- neo-tree
    use({
        "nvim-neo-tree/neo-tree.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim"
        }
    })

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

    -- Autopairs
    use("windwp/nvim-autopairs")

    -- Comments
    use("numToStr/Comment.nvim")
    use("JoosepAlviste/nvim-ts-context-commentstring")

    -- Git
    use("lewis6991/gitsigns.nvim")

    -- Bufferline
    use("akinsho/bufferline.nvim")

    -- Status line
    use("nvim-lualine/lualine.nvim")

    -- Formatter
    use({
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local conform = require("conform")

            conform.setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    html = { "htmlbeautifier" },
                    javascript = { "prettier" },
                },
            })
        end,
    })

    -- Indent lines
    use "lukas-reineke/indent-blankline.nvim"

    -- Dressing
    use "stevearc/dressing.nvim"

    -- Noice
    use({
        "folke/noice.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify"
        }
    })

    -- Set up configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
