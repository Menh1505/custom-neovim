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
    if input == nil or input == "" then -- Esc or nil to quit google_search
      vim.api.nvim_input("<Esc>")
      return
    end

    if input and input ~= "" then
      local encoded_query = input:gsub(" ", "+") -- Replace spacebar to "+"
      local url = "https://www.google.com/search?q=" .. encoded_query
      local open_cmd = "xdg-open" -- Use "open" for macOS, "start" for Windows
      os.execute(open_cmd .. " '" .. url .. "'")
    end
  end)
end

-- Keymap Google Search
vim.api.nvim_set_keymap(
  "n",
  "<leader>sz",
  ":lua _G.google_search()<CR>",
  { noremap = true, silent = true, desc = "Search on Google" }
)
