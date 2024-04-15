local status_ok, indentline = pcall(require, "ibl")

if not status_ok then
    return
end

indentline.setup()
