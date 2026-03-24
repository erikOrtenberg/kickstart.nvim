return { -- Give "syntax highlighting" to
  -- // TODO: ,
  -- // HACK: ,
  -- // WARN: ,
  -- // WARNING: ,
  -- // NOTE: ,
  -- // FIXME: ,
  -- // BUG: and
  -- // PERF:
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
}
