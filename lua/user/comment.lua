local status_ok, comment = pcall(require, "Comment")

if not status_ok then
  return
end

local context_status_ok, context_comment = pcall(require, "ts_context_commentstring")

if not context_status_ok then
  return
end

local context_integration = require("ts_context_commentstring.integrations.comment_nvim")

context_comment.setup {
  enable_autocmd = false
}

comment.setup {
  padding = true,
  sticky = true,
  ignore = nil,
  toggler = {
    line = 'gcc',
    block = 'gbc'
  },
  opleader = {
    line = 'gc',
    block = 'gb'
  },
  extra = {
    above = 'gcO',
    below = 'gco',
    eol = 'gcA'
  },
  mappings = {
    basic = true,
    extra = true
  },
  pre_hook = context_integration.create_pre_hook(),
  post_hook = nil
}

