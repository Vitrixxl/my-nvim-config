return {

  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = {
      blue   = '#89b4fa',
      cyan   = '#89dceb',
      black  = '#1e1e2e',
      white  = '#cdd6f4',
      red    = '#f38ba8',
      pink   = '#f5c2e7',
      violet = '#cba6f7',
      grey   = '#313244',
    }

    local bubbles_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.pink },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white },
      },

      insert = { a = { fg = colors.black, bg = colors.blue } },
      visual = { a = { fg = colors.black, bg = colors.white } },
      replace = { a = { fg = colors.black, bg = colors.red } },

      inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white },
      },
    }

    require('lualine').setup {
      options = {
        theme = bubbles_theme,
        component_separators = '',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { { 'mode', separator = { right = '' }, right_padding = 2 } },
        lualine_b = { 'branch', 'diff' },
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
          { 'location', separator = { left = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = { "branch", "diff", "diagnostics" },
      },
      tabline = {},
      extensions = {},
    }
  end,
}
