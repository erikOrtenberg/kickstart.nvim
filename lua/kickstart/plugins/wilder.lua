return {
  'gelguy/wilder.nvim',
  config = function()
    local wilder = require 'wilder'
    wilder.setup {
      modes = { ':', '/', '?' },
    }

    wilder.set_option(
      'renderer',
      wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
        max_height = 20,
        border = 'rounded',

        left = { ' ', wilder.popupmenu_devicons() },
        right = { ' ', wilder.popupmenu_scrollbar() },

        highlights = {
          default = 'WilderPopupMenuDefault',
          border = 'WilderPopupMenuBorder',
          accent = 'WilderPopupMenuAccent',
        },
      })
    )
  end,
}
