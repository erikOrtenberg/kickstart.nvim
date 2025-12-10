-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
-- [[ Auto Rooter ]] --
-----------------------

-- Array of file names indicating root directory. Modify to your liking.
local root_names = { '.git', 'Makefile' }

-- Cache to use for speed up (at cost of possibly outdated results)
local root_cache = {}
local root_cache_size = 0
local MAX_CACHE_SIZE = 50 -- Limit cache to prevent unbounded growth

local set_root = function()
  -- Get directory path to start search from
  ---@type string|nil
  local path = vim.api.nvim_buf_get_name(0)

  if path == '' or path == nil then
    return
  end

  path = vim.fs.dirname(path)

  if path == '' or path == nil then
    return
  end

  -- Try cache and resort to searching upward for root directory
  local root = root_cache[path]
  if root == nil then
    local root_file = vim.fs.find(root_names, { path = path, upward = true })[1]
    if root_file == nil then
      return
    end

    root = vim.fs.dirname(root_file)

    -- Clear cache if it gets too large to prevent memory leaks
    if root_cache_size >= MAX_CACHE_SIZE then
      root_cache = {}
      root_cache_size = 0
    end

    root_cache[path] = root
    root_cache_size = root_cache_size + 1
  end

  -- Set current directory
  vim.fn.chdir(root)

  -- Removed notification spam - it fires on every BufEnter which is excessive
  -- Only notify if you want to debug: vim.notify('Root set to ' .. root, 'info', { title = 'AutoRoot' })
end

local root_augroup = vim.api.nvim_create_augroup('AutoRoot', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', { group = root_augroup, callback = set_root })
