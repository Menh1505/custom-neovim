vim.api.nvim_create_user_command("OpenURL", function(opts)
  local url = opts.args

  -- Auto add https://
  if not url:match("^https?://") then
    url = "https://" .. url
  end

  local open_cmd

  if vim.fn.has("mac") == 1 then
    open_cmd = "open"
  elseif vim.fn.has("unix") == 1 then
    open_cmd = "xdg-open"
  elseif vim.fn.has("win32") == 1 then
    open_cmd = "cmd.exe /c start"
  else
    print("Can not open URL on this system!")
    return
  end

  os.execute(open_cmd .. " " .. url .. " &")
end, { nargs = 1 })
