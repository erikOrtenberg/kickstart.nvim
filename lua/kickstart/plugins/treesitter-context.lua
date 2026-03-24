return { -- Shows context on top line always (func def, for example)
  'nvim-treesitter/nvim-treesitter-context',
  event = 'LazyFile',
  config = function()
    require('treesitter-context').setup {
      mode = 'cursor',
      max_lines = 3,
    }
  end,
}
