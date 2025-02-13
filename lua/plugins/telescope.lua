_G.google_search_picker = function()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  -- Func open browser with Search
  local function open_google_search(query)
    if query and query ~= "" then
      local encoded_query = query:gsub(" ", "+") -- Convert spacebar to '+'
      local url = "https://www.google.com/search?q=" .. encoded_query
      local open_cmd = "xdg-open" -- Linux (or 'open' on macOS, 'start' on Windows)
      os.execute(open_cmd .. " '" .. url .. "'")
    end
  end

  -- Custom Picker for Google search
  pickers
    .new({}, {
      prompt_title = "Search Google",
      finder = finders.new_dynamic({
        fn = function(input)
          return { input }
        end,
      }),
      sorter = conf.generic_sorter({}),
      attach_mappings = function(prompt_bufnr, map)
        local function search()
          local selection = action_state.get_current_line()
          if selection then
            open_google_search(selection)
          end
          actions.close(prompt_bufnr)
        end

        map("i", "<CR>", search) -- Enter in Insert mode
        map("n", "<CR>", search) -- Enter in Normal mode
        return true
      end,
    })
    :find()
end

-- Keymap to open_google_search
vim.api.nvim_set_keymap(
  "n",
  "<leader>sz",
  ":lua google_search_picker()<CR>",
  { noremap = true, silent = true, desc = "Search on Google" }
)
