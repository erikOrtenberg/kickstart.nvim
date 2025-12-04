-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- ESCAPE ME
local function close_floats()
  for _, winid in ipairs(vim.api.nvim_list_wins()) do
    local ok, win = pcall(vim.api.nvim_win_get_config, winid)
    if ok and win.relative == 'win' then
      vim.api.nvim_win_close(winid, false)
    end
  end
end

local function snippet_stop()
  if vim.snippet then
    vim.snippet.stop()
  end
end

local function escape()
  vim.cmd 'noh'
  snippet_stop()
  return '<esc>'
end

vim.keymap.set({ 'i', 'n', 's' }, '<Esc>', escape, { expr = true, desc = 'Escape' })
vim.keymap.set('n', '<Esc>', close_floats, { desc = 'Close floats' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
-- vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-w><C-h>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-w><C-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-w><C-k>', '<C-w>k', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-w><C-l>', '<C-w>l', { desc = 'Move focus to the right window' })
-- Rebind hjkl to jklö
--vim.keymap.set('n', '<C-w><C-j>', '<C-w>h', { desc = 'Move focus to the left window' })
--vim.keymap.set('n', '<C-w><C-k>', '<C-w>j', { desc = 'Move focus to the lower window' })
--vim.keymap.set('n', '<C-w><C-l>', '<C-w>k', { desc = 'Move focus to the upper window' })
--vim.keymap.set('n', '<C-w><C-ö>', '<C-w>l', { desc = 'Move focus to the right window' })
--
--vim.keymap.set({ 'n', 'v', 'o' }, 'j', 'h', { noremap = true, silent = true })
--vim.keymap.set({ 'n', 'v', 'o' }, 'k', 'j', { noremap = true, silent = true })
--vim.keymap.set({ 'n', 'v', 'o' }, 'l', 'k', { noremap = true, silent = true })
--vim.keymap.set({ 'n', 'v', 'o' }, 'ö', 'l', { noremap = true, silent = true })
--
--vim.keymap.set({ 'n' }, '<C-w>j', '<C-w>h', { noremap = true, silent = true })
--vim.keymap.set({ 'n' }, '<C-w>k', '<C-w>j', { noremap = true, silent = true })
--vim.keymap.set({ 'n' }, '<C-w>l', '<C-w>k', { noremap = true, silent = true })
--vim.keymap.set({ 'n' }, '<C-w>ö', '<C-w>l', { noremap = true, silent = true })
-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })

vim.keymap.set({ 'n', 'v' }, '<Up>', ":echoe 'Get off my lawn!'<CR>")
vim.keymap.set({ 'n', 'v' }, '<Down>', ":echoe 'Get off my lawn!'<CR>")
vim.keymap.set({ 'n', 'v' }, '<Left>', ":echoe 'Get off my lawn!'<CR>")
vim.keymap.set({ 'n', 'v' }, '<Right>', ":echoe 'Get off my lawn!'<CR>")

vim.keymap.set('i', '<Up>', '<nop>')
vim.keymap.set('i', '<Down>', '<nop>')
vim.keymap.set('i', '<Left>', '<nop>')
vim.keymap.set('i', '<Right>', '<nop>')
