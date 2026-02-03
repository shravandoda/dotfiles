--------------------------------------------------

-- Author: Shravan Doda
-- Email: shravanbharatdoda@gmail.com
-- Github: github.com/shravandoda
-- Licence: MIT

--------------------------------------------------

----------------------------------------------------------------------
--- File Tree
----------------------------------------------------------------------

return {
  --------------------------------------------------
  --- Oil.nvim
  --------------------------------------------------

  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    lazy = true,
    keys = {
      { '-', '<cmd>Oil --float<CR>', desc = 'Open parent directory (Oil)' },
    },
    opts = {
      default_file_explorer = false,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        natural_order = 'fast',
        case_sensitive = true,
        is_always_hidden = function(name, _)
          return name == '.git' or name == '..'
        end,
      },
      win_options = {
        wrap = true,
      },
      float = {
        padding = 5,
        max_width = 0.7,
        max_height = 0.7,
      },
    },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    lazy = false,
    keys = {
      { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Open Explorer' },
      { '<leader>E', '<cmd>Neotree reveal<cr>', desc = 'Reveal file in Explorer' },
      { '<leader>ge', '<cmd>Neotree git_status toggle<cr>', desc = 'Git Explorer' },
      { '<leader>be', '<cmd>Neotree buffers toggle<cr>', desc = 'Buffer Explorer' },
    },
    config = function()
      -- Diagnostic icons
      vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
      vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
      vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
      vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵 ', texthl = 'DiagnosticSignHint' })

      require('neo-tree').setup {
        close_if_last_window = true,
        popup_border_style = 'rounded',
        enable_git_status = true,
        enable_diagnostics = true,
        sort_case_insensitive = true,
        default_component_configs = {
          indent = {
            indent_size = 2,
            padding = 1,
            with_markers = true,
            indent_marker = '│',
            last_indent_marker = '└',
            highlight = 'NeoTreeIndentMarker',
            with_expanders = true,
            expander_collapsed = '',
            expander_expanded = '',
            expander_highlight = 'NeoTreeExpander',
          },
          icon = {
            folder_closed = '',
            folder_open = '',
            folder_empty = '',
            default = '',
            highlight = 'NeoTreeFileIcon',
          },
          modified = {
            symbol = '●',
            highlight = 'NeoTreeModified',
          },
          name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = 'NeoTreeFileName',
          },
          git_status = {
            symbols = {
              added = '✚',
              modified = '',
              deleted = '✖',
              renamed = '󰁕',
              untracked = '',
              ignored = '',
              unstaged = '󰄱',
              staged = '',
              conflict = '',
            },
          },
        },
        window = {
          position = 'left',
          width = 40,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ['<space>'] = 'none',
            ['<cr>'] = 'open',
            ['l'] = 'open',
            ['h'] = 'close_node',
            ['s'] = 'open_split',
            ['v'] = 'open_vsplit',
            ['t'] = 'open_tabnew',
            ['P'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = false } },
            ['C'] = 'close_node',
            ['z'] = 'close_all_nodes',
            ['Z'] = 'expand_all_nodes',
            ['a'] = { 'add', config = { show_path = 'relative' } },
            ['A'] = 'add_directory',
            ['d'] = 'delete',
            ['r'] = 'rename',
            ['y'] = 'copy_to_clipboard',
            ['x'] = 'cut_to_clipboard',
            ['p'] = 'paste_from_clipboard',
            ['c'] = 'copy',
            ['m'] = 'move',
            ['q'] = 'close_window',
            ['R'] = 'refresh',
            ['?'] = 'show_help',
            ['<'] = 'prev_source',
            ['>'] = 'next_source',
          },
        },
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              '.git',
              '.DS_Store',
            },
            never_show = {
              '.DS_Store',
              'thumbs.db',
            },
          },
          follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
          },
          group_empty_dirs = false,
          hijack_netrw_behavior = 'open_current',
          use_libuv_file_watcher = true,
          window = {
            mappings = {
              ['<bs>'] = 'navigate_up',
              ['.'] = 'set_root',
              ['H'] = 'toggle_hidden',
              ['/'] = 'fuzzy_finder',
              ['f'] = 'filter_on_submit',
              ['<c-x>'] = 'clear_filter',
              ['[g'] = 'prev_git_modified',
              [']g'] = 'next_git_modified',
            },
          },
        },
        buffers = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
          },
          group_empty_dirs = true,
          show_unloaded = true,
        },
        git_status = {
          window = {
            position = 'float',
          },
        },
        event_handlers = {
          {
            event = 'file_open_requested',
            handler = function()
              require('neo-tree.command').execute { action = 'close' }
            end,
          },
        },
      }
    end,
  },
  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = true,
  },
}
