--------------------------------------------------

-- Author: Shravan Doda
-- Email: shravanbharatdoda@gmail.com
-- Github: github.com/shravandoda
-- Licence: MIT

--------------------------------------------------

----------------------------------------------------------------------
-- Formatting
----------------------------------------------------------------------

return {

  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true, python = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        docker = { 'docker-language-server' },
        json = { 'jsonls' },
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        python = { 'ruff', 'black' },
        terraform = { 'terraform-ls' },
        yaml = { 'yamlfmt' },
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },

  -- Useful utilities for manipulating strings
  -- such as case conversion and substitutions
  { 'tpope/vim-abolish' },
}
