vim.api.nvim_create_user_command("SquixRun", function(opts)
  local cmd = string.format('squix run "%s"', opts.args)
  vim.cmd.split()
  vim.cmd.terminal(cmd)
end, { nargs = "*", range = true })

-- get visual selection text
local function get_visual_selection()
  local s_start = vim.fn.getpos("'<")
  local s_end = vim.fn.getpos("'>")
  local lines = vim.fn.getline(s_start[2], s_end[2])
  if #lines == 0 then return "" end
  lines[#lines] = string.sub(lines[#lines], 1, s_end[3])
  lines[1] = string.sub(lines[1], s_start[3])
  return table.concat(lines, "\n")
end

vim.keymap.set("v", "<leader>sx", function()
  vim.cmd('normal! "vy')
  local sel = vim.fn.getreg("v")
  vim.cmd.split()
  vim.cmd.terminal(string.format('squix run "%s"', sel))
end, { desc = "Run squix with visual selection" })
