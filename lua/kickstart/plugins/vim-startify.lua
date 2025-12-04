return {
  {
    'mhinz/vim-startify',
    -- enabled = false,
    init = function()
      vim.g['ascii'] = {
        [[]],
        [[       ::::    ::: :::::::::: ::::::::  :::     ::: :::::::::::   :::   :::  ]],
        [[      :+:+:   :+: :+:       :+:    :+: :+:     :+:     :+:      :+:+: :+:+:  ]],
        [[     :+:+:+  +:+ +:+       +:+    +:+ +:+     +:+     +:+     +:+ +:+:+ +:+  ]],
        [[    +#+ +:+ +#+ +#++:++#  +#+    +:+ +#+     +:+     +#+     +#+  +:+  +#+   ]],
        [[   +#+  +#+#+# +#+       +#+    +#+  +#+   +#+      +#+     +#+       +#+    ]],
        [[  #+#   #+#+# #+#       #+#    #+#   #+#+#+#       #+#     #+#       #+#     ]],
        [[ ###    #### ########## ########      ###     ########### ###       ###      ]],
        [[]],
        [[]],
      }

      vim.g['startify_custom_header'] = 'map(g:ascii, "\\"   \\".v:val")'

      vim.g['startify_enable_special'] = 0 -- show empty buffer and quit
      vim.g['startify_enable_unsafe'] = 0 -- speeds up startify but sacrifices some accuracy
      vim.g['startify_fortune_use_unicode'] = 1
      vim.g['startify_relative_path'] = 1

      vim.g['startify_session_sort'] = 1 -- sort descending by last used
      vim.g['startify_session_number'] = 9 -- number of sessions

      vim.cmd [[let g:startify_custom_indices = map(range(1,100), 'string(v:val)')]] -- start at 1
      vim.g['startify_skiplist'] = { 'COMMIT_EDITMSG', '.DS_Store' } -- disable common but unimportant files
      vim.g['startify_files_number'] = 9 -- recently used
      vim.g['startify_change_to_dir'] = 0 -- this feature should not even exist. It is stupid.

      vim.g['startify_session_dir'] = vim.fn.stdpath 'state' .. '/sessions'

      -- reorder and whitelist certain groups
      vim.g['startify_lists'] = {
        { type = 'sessions', header = { '   Sessions' } },
        { type = 'dir', header = { '   Recent in ' .. vim.fn.getcwd() } },
        { type = 'bookmarks', header = { '   Bookmarks' } },
      }
    end,
  },
  -- {
  --   'goolord/alpha-nvim',
  --   dependencies = { 'echasnovski/mini.icons' },
  --   config = function() require('alpha').setup(require('alpha.themes.startify').config) end,
  -- },
}
