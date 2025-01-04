return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      sections = {
        lualine_a = { 'mode' }, 
        lualine_b = { 'branch', 'diff' }, 
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' }, 
        lualine_y = { 'progress' },
        lualine_z = { 'location' }, 
      },
      inactive_sections = { 
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
      },
      tabline = {
        lualine_b = {'branch'},
        lualine_c = {
          {
            'buffers',
            show_filename_only = true,
            mode = 2,
          },
        },
        lualine_z = {'tabs'}
      },
      options = {
        theme = 'auto', 
        icons_enabled = true, 
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        always_show_tabline = true,
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        }
      }
    })
  end,
}


