return {
    "folke/snacks.nvim",
    opts = {
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = false }, -- we set this in options.lua
      toggle = {
        map = function(mode, lhs, rhs, opts)
          vim.keymap.set(mode, lhs, rhs, opts or { noremap = true, silent = true })
        end,
      },
      words = { enabled = true },
      keys = {
        { "<leader>n", function()
            if require("snacks.config").picker and require("snacks.config").picker.enabled then
              require("snacks.picker").notifications()
            else
              require("snacks.notifier").show_history()
            end
          end, desc = "Notification History" 
        },
        { "<leader>un", function() require("snacks.notifier").hide() end, desc = "Dismiss All Notifications" },
      },
      dashboard = {
        preset = {
          header = [[
          ███╗   ███╗███████╗███╗   ██╗██╗  ██╗██╗   ██╗████████╗██╗  ██╗██╗███████╗███╗   ██╗
          ████╗ ████║██╔════╝████╗  ██║██║  ██║╚██╗ ██╔╝╚══██╔══╝██║  ██║██║██╔════╝████╗  ██║
          ██╔████╔██║█████╗  ██╔██╗ ██║███████║ ╚████╔╝    ██║   ███████║██║█████╗  ██╔██╗ ██║
          ██║╚██╔╝██║██╔══╝  ██║╚██╗██║██╔══██║  ╚██╔╝     ██║   ██╔══██║██║██╔══╝  ██║╚██╗██║
          ██║ ╚═╝ ██║███████╗██║ ╚████║██║  ██║   ██║      ██║   ██║  ██║██║███████╗██║ ╚████║
          ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚═╝  ╚═╝╚═╝╚══════╝╚═╝  ╚═══╝
          ]],
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua require('snacks.dashboard').pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua require('snacks.dashboard').pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua require('snacks.dashboard').pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config", action = ":lua require('snacks.dashboard').pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
}

