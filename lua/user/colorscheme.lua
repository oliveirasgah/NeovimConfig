local colorscheme = "kanagawa-wave"
--local colorscheme = "kanagawa-dragon"
--local colorscheme = "kanagawa-lotus"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  return
else
  -- Remove background from Neovim
  --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- Remove background from loats
end

