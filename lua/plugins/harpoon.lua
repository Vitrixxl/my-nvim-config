return {
  "ThePrimeagen/harpoon",
  config = function()
    require("harpoon").setup({
      save_on_toggle = true,
      save_on_change = true,
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },

      tabline = true,
      tabline_prefix = "   ",
      tabline_suffix = "   ",
    })
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>a", mark.add_file)
    vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
    vim.keymap.set("n", "<C-T>", function() ui.nav_file(1) end)
    vim.keymap.set("n", "<C-H>", function() ui.nav_file(2) end)
    vim.keymap.set("n", "<C-N>", function() ui.nav_file(3) end)
    -- vim.keymap.set("n", "<C-S>", function() ui.nav_file(4) end)
    vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
    vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
    vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
    vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
    vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')
  end,
}
