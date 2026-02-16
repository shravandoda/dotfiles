--------------------------------------------------

-- Author: Shravan Doda
-- Email: shravanbharatdoda@gmail.com
-- Github: github.com/shravandoda
-- Licence: MIT

--------------------------------------------------

----------------------------------------------------------------------
-- Git Signs
----------------------------------------------------------------------

-- See `:help gitsigns` to understand what the configuration keys do
-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 500,
        },
      }
    end,
    vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>', { desc = 'Toggle [G]it [B]lame' }),
    vim.keymap.set('n', '<leader>gh', ':Gitsigns preview_hunk_inline<CR>', { desc = 'Toggle [G]it [H]unk' }),
  },

  ----------------------------------------------------------------------
  -- Diffview
  ----------------------------------------------------------------------
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewFileHistory' },
    keys = {
      { '<leader>gv', '<cmd>DiffviewOpen<cr>', desc = '[G]it Diff [V]iew' },
      { '<leader>gV', '<cmd>DiffviewClose<cr>', desc = '[G]it Diff [V]iew Close' },
      { '<leader>gf', '<cmd>DiffviewFileHistory %<cr>', desc = '[G]it [F]ile History' },
      { '<leader>gF', '<cmd>DiffviewFileHistory<cr>', desc = '[G]it All [F]ile History' },
      { '<leader>gm', '<cmd>DiffviewOpen<cr>', desc = '[G]it [M]erge Tool (when conflicts exist)' },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = {
          layout = 'diff2_horizontal',
        },
        merge_tool = {
          layout = 'diff3_mixed',
          disable_diagnostics = true,
        },
      },
      file_panel = {
        listing_style = 'tree',
        tree_options = {
          flatten_dirs = true,
          folder_statuses = 'only_folded',
        },
        win_config = {
          position = 'left',
          width = 35,
        },
      },
      keymaps = {
        view = {
          { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Close Diffview' } },
        },
        file_panel = {
          { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Close Diffview' } },
        },
        file_history_panel = {
          { 'n', 'q', '<cmd>DiffviewClose<cr>', { desc = 'Close Diffview' } },
        },
      },
    },
  },
}
