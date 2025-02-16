-- All vim helper

local map = vim.keymap.set

-- Copy diagnostic
map("n", "<leader>xc", function()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
  if #diagnostics > 0 then
    local message = diagnostics[1].message
    vim.fn.setreg("+", message)
    print("Coied diagnostic: " .. message)
  else
    print("No diagnostic at cursor")
  end
end, { noremap = true, silent = true, desc = "Copy diagnostic" })

-- Search Google in Vim
_G.google_search = function()
  vim.ui.input({ prompt = "Search Google: " }, function(input)
    if input == nil or input == "" then
      vim.api.nvim_input("<Esc>")
      return
    end

    local encoded_query = input:gsub(" ", "+")
    local url = "https://www.google.com/search?q=" .. encoded_query

    -- Check running on WSL
    local open_cmd
    local is_wsl = os.execute("grep -qi microsoft /proc/version") == 0

    if is_wsl then
      -- Check have `wslview`
      if os.execute("command -v wslview > /dev/null") == 0 then
        open_cmd = "wslview"
      else
        open_cmd = 'cmd.exe /c start "" ' -- Open default browser of Windows
      end
    else
      open_cmd = "xdg-open" -- Linux
    end

    -- Run command open URL
    os.execute(open_cmd .. ' "' .. url .. '" &')
  end)
end

-- Keymap Google Search
vim.api.nvim_set_keymap(
  "n",
  "<leader>sz",
  ":lua _G.google_search()<CR>",
  { noremap = true, silent = true, desc = "Search on Google" }
)
