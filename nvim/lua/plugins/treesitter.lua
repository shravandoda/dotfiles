--------------------------------------------------

-- Author: Shravan Doda
-- Email: shravanbharatdoda@gmail.com
-- Github: github.com/shravandoda
-- Licence: MIT

--------------------------------------------------

return {
  ----------------------------------------------------------------------
  -- Treesitter
  ----------------------------------------------------------------------

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'python', 'terraform', 'query' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },

  ----------------------------------------------------------------------
  --- Aerial - Code Outline
  ----------------------------------------------------------------------

  {
    'stevearc/aerial.nvim',
    opts = {},
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('aerial').setup {
        backends = { 'lsp', 'treesitter', 'markdown' },
        on_attach = function(bufnr)
          vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr, desc = 'Aerial Prev' })
          vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr, desc = 'Aerial Next' })
          vim.keymap.set('n', '[[', '<cmd>AerialPrevUp<CR>', { buffer = bufnr, desc = 'Aerial Prev Up' })
          vim.keymap.set('n', ']]', '<cmd>AerialNextUp<CR>', { buffer = bufnr, desc = 'Aerial Next Up' })
        end,
        layout = { default_direction = 'prefer_right' },
        show_guides = true,
      }
      vim.keymap.set('n', '<leader>A', '<cmd>AerialToggle!<CR>', { desc = '[A]erial Toggle' })
    end,
  },
}
