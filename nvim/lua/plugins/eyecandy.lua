--------------------------------------------------

-- Author: Shravan Doda
-- Email: shravanbharatdoda@gmail.com
-- Github: github.com/shravandoda
-- Licence: MIT

--------------------------------------------------

----------------------------------------------------------------------
--  Eye Candy
----------------------------------------------------------------------

return {

  --------------------------------------------------------------------
  --- Tokyo Night Theme
  --------------------------------------------------------------------
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('tokyonight').setup {
  --       style = 'storm',
  --       terminal_colors = true,
  --       styles = {
  --         comments = { italic = true },
  --         keywords = { italic = false, bold = true },
  --         functions = { italic = true },
  --         variables = {},
  --       },
  --     }
  --     vim.cmd 'colorscheme tokyonight-storm'
  --   end,
  -- },
  --
  --------------------------------------------------------------------
  --- Kanagawa Theme
  --------------------------------------------------------------------
  -- {
  --   'rebelot/kanagawa.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('kanagawa').setup {
  --       compile = false,
  --       undercurl = true,
  --       commentStyle = { italic = true },
  --       keywordStyle = { bold = true },
  --       statementStyle = { bold = true },
  --       theme = 'lotus',
  --       terminalColors = true,
  --       background = {
  --         dark = 'dragon',
  --         light = 'lotus',
  --       },
  --     }
  --     vim.o.background = 'light'
  --     vim.cmd 'colorscheme kanagawa'
  --   end,
  -- },

  --------------------------------------------------------------------
  --- VSCode Theme (Trying to feel at home)
  --------------------------------------------------------------------

  -- {
  --   'Mofiqul/vscode.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('vscode').setup {
  --       italic_comments = true,
  --       italic_inlay_hints = true,
  --       underline_links = true,
  --       terminal_colors = true,
  --     }
  --     vim.cmd 'colorscheme vscode'
  --   end,
  -- },

  --------------------------------------------------------------------
  --- Catppuccin Theme
  --------------------------------------------------------------------

  -- {
  --   'catppuccin/nvim',
  --   priority = 1000,
  --   config = function()
  --     require('catppuccin').setup {
  --       flavor = 'macchiato',
  --       background = {
  --         light = 'latte',
  --         dark = 'macchiato',
  --       },
  --       float = {
  --         transparency = true,
  --       },
  --       styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
  --         comments = { 'italic' }, -- Change the style of comments
  --         conditionals = { 'italic' },
  --         loops = {},
  --         functions = { 'italic' },
  --         keywords = {},
  --         strings = {},
  --         variables = {},
  --         numbers = {},
  --         booleans = {},
  --         properties = {},
  --         types = {},
  --         operators = {},
  --       },
  --       show_end_of_buffer = true,
  --       term_colors = true,
  --       integrations = {
  --         cmp = true,
  --         gitsigns = true,
  --         notify = true,
  --         mini = {
  --           enabled = true,
  --           use_background = true,
  --         },
  --       },
  --     }
  --     vim.o.background = 'light'
  --     vim.cmd.colorscheme 'catppuccin'
  --   end,
  -- },
  --
  --
  --------------------------------------------------------------------
  --- Ayu Theme
  --------------------------------------------------------------------
  -- {
  --   'Shatur/neovim-ayu',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('ayu').setup {
  --       mirage = true,
  --       terminal = true,
  --       comments = true,
  --       functions = true,
  --     }
  --     vim.o.background = 'light'
  --     vim.cmd.colorscheme 'ayu'
  --   end,
  -- },

  -------------------------------------------------------------------
  --- Gruvbox Material Theme
  -------------------------------------------------------------------
  {
    'sainnhe/gruvbox-material',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = 'medium'
      vim.g.gruvbox_material_foreground = 'mix'
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_cursor = 'red'
      vim.g.gruvbox_material_ui_contrast = 'high'

      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },

  --------------------------------------------------------------------
  --- Gruvbox Material Lua Port
  --------------------------------------------------------------------

  -- {
  --   'ellisonleao/gruvbox.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.o.background = 'light'
  --     require('gruvbox').setup {
  --       terminal_colors = true,
  --       undercurl = true,
  --       underline = true,
  --       bold = true,
  --       italic = {
  --         strings = true,
  --         emphasis = true,
  --         comments = true,
  --         operators = false,
  --         folds = true,
  --       },
  --       strikethrough = true,
  --       invert_selection = false,
  --       invert_signs = false,
  --       invert_tabline = false,
  --       inverse = false,
  --       contrast = 'hard',
  --       palette_overrides = {},
  --       overrides = {
  --         WinSeparator = { link = 'GruvboxBg2' },
  --         VertSplit = { link = 'GruvboxBg2' },
  --         FloatBorder = { link = 'GruvboxBg2' },
  --         NormalFloat = { link = 'Normal' },
  --         TelescopeBorder = { link = 'GruvboxBg2' },
  --         TelescopePromptBorder = { link = 'GruvboxBg2' },
  --         TelescopeResultsBorder = { link = 'GruvboxBg2' },
  --         TelescopePreviewBorder = { link = 'GruvboxBg2' },
  --       },
  --       dim_inactive = false,
  --       transparent_mode = false,
  --     }
  --     vim.cmd 'colorscheme gruvbox'
  --   end,
  -- },

  {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1000,
    config = function()
      require('github-theme').setup {
        options = {
          styles = {
            comments = 'italic',
            keywords = 'bold',
          },
        },
      }

      vim.o.background = 'light'
      vim.cmd 'colorscheme github_light_default'
    end,
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require('rose-pine').setup {
        variant = 'dawn', -- auto, main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,
        styles = {
          bold = true,
          italic = true,
          transparency = false,
        },
      }

      vim.cmd 'colorscheme rose-pine-dawn'
    end,
  },

  --------------------------------------------------------------------
  -- Highlight todo, notes, etc in comments
  --------------------------------------------------------------------
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
