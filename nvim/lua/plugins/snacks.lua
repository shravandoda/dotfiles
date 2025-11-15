--------------------------------------------------

-- Author: Shravan Doda
-- Email: shravanbharatdoda@gmail.com
-- Github: github.com/shravandoda
-- Licence: MIT

--------------------------------------------------

return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      notifier = { enabled = true },
      -- explorer = { enabled = true, replace_netrw = true, auto_close = true },
    },
    keys = {
      {
        '<leader>nh',
        function()
          Snacks.picker.notifications()
        end,
        desc = '[N]otifications [H]istory',
      },
      -- {
      --   '<leader>e',
      --   function()
      --     Snacks.explorer()
      --   end,
      --   desc = '[E]xplorer',
      -- },
    },
  },
}
