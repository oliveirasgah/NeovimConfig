local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
    return
end

bufferline.setup {
    options = {
        separator_style = "slope",
        always_show_bufferline = false,
        offsets = {
            {
                filetype = "neo-tree",
                text = "neo-tree",
                separator = true,
                text_align = "center",
                highlight = "Directory"
            }
        }
    }
}
