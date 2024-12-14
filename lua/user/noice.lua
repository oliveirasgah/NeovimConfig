local status_ok, noice = pcall(require, "noice")

if not status_ok then
    return
end

noice.setup({
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true
        }
    },
    presets = {
        command_palette = true,
        bottom_search = false,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false
    }
})
