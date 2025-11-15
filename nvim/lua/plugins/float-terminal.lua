--------------------------------------------------

-- Author: Shravan Doda
-- Email: shravanbharatdoda@gmail.com
-- Github: github.com/shravandoda
-- Licence: MIT

--------------------------------------------------

----------------------------------------------------------------------
--  Floating Terminal
----------------------------------------------------------------------

local floaterm_state = {
  win_id = -1, -- Default value indicating no window
  buf_id = -1, -- Default value indicating no buffer
}

local function create_floating_window(opts)
  opts = opts or {}

  local buf_id
  local win_id

  -- Create a new buffer
  if not vim.api.nvim_buf_is_valid(opts.buf_id) then
    buf_id = vim.api.nvim_create_buf(false, true) -- Create a scratch buffer
  else
    buf_id = opts.buf_id
  end

  -- Calculate window dimensions and position
  -- Width and height are 80% of the screen size

  local lines = vim.o.lines
  local columns = vim.o.columns

  local width = math.floor(columns * 0.7)
  local height = math.floor(lines * 0.7)

  -- Row and col are set to center the window
  local row_pos = math.floor((lines - height) / 2)
  local col_pos = math.floor((columns - width) / 2)

  win_id = vim.api.nvim_open_win(buf_id, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row_pos,
    col = col_pos,
    style = 'minimal',
    border = 'rounded',
  })

  return buf_id, win_id
end

local function toggle_floaterm()
  if not vim.api.nvim_win_is_valid(floaterm_state.win_id) then
    -- If the window is not open, create it
    local buf_id, win_id = create_floating_window { buf_id = floaterm_state.buf_id }
    floaterm_state.win_id = win_id
    floaterm_state.buf_id = buf_id
    if vim.bo[floaterm_state.buf_id].buftype ~= 'terminal' then
      vim.cmd 'terminal'
    end
  else
    vim.api.nvim_win_hide(floaterm_state.win_id)
  end
end

-- Key mapping to toggle the floating terminal
vim.keymap.set('n', '<leader>tt', toggle_floaterm, { desc = '[T]oggle [T]erminal' })

return {}
