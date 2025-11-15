--------------------------------------------------

-- Author: Shravan Doda
-- Email: shravanbharatdoda@gmail.com
-- Github: github.com/shravandoda
-- Licence: MIT

--------------------------------------------------

----------------------------------------------------------------------
--- Buffer Management
----------------------------------------------------------------------

return {
  --------------------------------------------------
  --- Harpoon
  --------------------------------------------------

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = function()
      local keys = {
        {
          '<leader>ha',
          function()
            require('harpoon'):list():add()
          end,
          desc = '[A]dd file to Harpoon',
        },
        {
          '<leader>hl',
          function()
            local harpoon = require 'harpoon'
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = '[L]ist Harpoon files',
        },
      }

      for i = 1, 5 do
        table.insert(keys, {
          '<leader>h' .. i,
          function()
            require('harpoon'):list():select(i)
          end,
          desc = 'Harpoon to File ' .. i,
        })
      end
      return keys
    end,
  },

  --------------------------------------------------
  --- Bufferline
  --------------------------------------------------

  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {
        options = {
          mode = 'buffers',
          themeable = true,
          indicator = {
            icon = '▎',
            style = 'underline',
          },
          separator_style = 'slant',
          color_icons = true,
          show_close_icon = false,
          show_tab_indicators = false,
        },
      }
    end,
    vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next Buffer' }),
    vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Next Buffer' }),
  },
}
