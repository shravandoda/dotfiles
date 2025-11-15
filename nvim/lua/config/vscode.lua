--------------------------------------------------

-- Author: Shravan Doda
-- Email: shravanbharatdoda@gmail.com
-- Github: github.com/shravandoda
-- Licence: MIT

--------------------------------------------------

-- Keymaps function

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Set Leader Key
vim.g.mapleader = ','
vim.g.maplocalleader = ' '

--
vim.o.clipboard = 'unnamedplus'

-- Better line navigation
--  See `:help move`
keymap('n', 'j', 'gj', { desc = 'Move down by display line' })
keymap('n', 'k', 'gk', { desc = 'Move up by display line' })
keymap('v', 'j', 'gj', { desc = 'Move down by display line' })
keymap('v', 'k', 'gk', { desc = 'Move up by display line' })

-- Better indentation in visual mode
keymap('v', '<', '<gv', { desc = 'Indent left and reselect' })
keymap('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- Clear highlights on search when pressing <Esc> in normal mode
keymap('n', '<Esc>', '<Esc>:noh<CR>', opts)

----------------------------------------------------------------------
--- VSCode Neovim keybindings
----------------------------------------------------------------------

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- File explorer (like your oil setup with -)
vim.keymap.set('n', '-', "<cmd>lua require('vscode').action('workbench.view.explorer')<CR>", { desc = 'Open file [E]xplorer' })

-- Better line navigation
vim.keymap.set('n', 'j', 'gj', { desc = 'Move down by display line' })
vim.keymap.set('n', 'k', 'gk', { desc = 'Move up by display line' })
vim.keymap.set('v', 'j', 'gj', { desc = 'Move down by display line' })
vim.keymap.set('v', 'k', 'gk', { desc = 'Move up by display line' })

-- Better indentation in visual mode
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- Terminal keymaps
vim.keymap.set(
  { 'n', 'v' },
  '<leader>tt',
  "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>",
  { desc = '[T]oggle [T]erminal' }
)
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Focus navigation between VSCode panes (terminal, editor, etc.)
vim.keymap.set('n', '<C-h>', "<cmd>lua require('vscode').action('workbench.action.navigateLeft')<CR>", { desc = 'Navigate to left pane' })
vim.keymap.set('n', '<C-l>', "<cmd>lua require('vscode').action('workbench.action.navigateRight')<CR>", { desc = 'Navigate to right pane' })
vim.keymap.set('n', '<C-j>', "<cmd>lua require('vscode').action('workbench.action.navigateDown')<CR>", { desc = 'Navigate to lower pane' })
vim.keymap.set('n', '<C-k>', "<cmd>lua require('vscode').action('workbench.action.navigateUp')<CR>", { desc = 'Navigate to upper pane' })

-- Focus commands for common VSCode elements
vim.keymap.set('n', '<leader>fe', "<cmd>lua require('vscode').action('workbench.files.action.focusFilesExplorer')<CR>", { desc = '[F]ocus file [E]xplorer' })
vim.keymap.set('n', '<leader>ft', "<cmd>lua require('vscode').action('workbench.action.terminal.focus')<CR>", { desc = '[F]ocus [T]erminal' })
vim.keymap.set('n', '<leader>fc', "<cmd>lua require('vscode').action('workbench.action.focusFirstEditorGroup')<CR>", { desc = '[F]ocus editor [C]ontent' })

-- Quick jump back to editor from anywhere
vim.keymap.set(
  'n',
  '<leader><leader>',
  "<cmd>lua require('vscode').action('workbench.action.focusFirstEditorGroup')<CR>",
  { desc = 'Quick jump back to editor' }
)

-- Code actions and diagnostics
vim.keymap.set({ 'n', 'v' }, '<leader>f', "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>", { desc = '[F]ormat document' })
vim.keymap.set({ 'n', 'v' }, '<leader>a', "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>", { desc = 'Quick [A]ction/fix' })
vim.keymap.set('n', '<leader>q', "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>", { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set({ 'n', 'v' }, '<leader>h', "<cmd>lua require('vscode').action('editor.action.showHover')<CR>", { desc = 'Show [H]over info' })

-- Debug
vim.keymap.set({ 'n', 'v' }, '<leader>b', "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>", { desc = 'Toggle [B]reakpoint' })

-- Buffer management
vim.keymap.set('n', '<leader>bd', "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>", { desc = '[B]uffer [D]elete/close' })

-- Search and navigation
vim.keymap.set({ 'n', 'v' }, '<leader>sf', "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>", { desc = '[S]earch [F]iles' })
vim.keymap.set({ 'n', 'v' }, '<leader>sc', "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>", { desc = '[S]earch [C]ommands' })

-- Notifications
vim.keymap.set({ 'n', 'v' }, '<leader>cn', "<cmd>lua require('vscode').action('notifications.clearAll')<CR>", { desc = '[C]lear [N]otifications' })

-- Project manager keymaps
vim.keymap.set({ 'n', 'v' }, '<leader>pa', "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>", { desc = '[P]roject [A]dd/save' })
vim.keymap.set({ 'n', 'v' }, '<leader>po', "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>", { desc = '[P]roject [O]pen list' })
vim.keymap.set({ 'n', 'v' }, '<leader>pe', "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>", { desc = '[P]roject [E]dit list' })
