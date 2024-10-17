return {
  "catppuccin/nvim",
  config = function()
    require("catppuccin").setup({
      flavor = "mocha",
    })
    vim.cmd.colorscheme "catppuccin-mocha"
    vim.cmd([[
  autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
  autocmd ColorScheme * highlight NonText guibg=NONE ctermbg=NONE
  autocmd ColorScheme * highlight LineNr guibg=NONE ctermbg=NONE
  autocmd ColorScheme * highlight SignColumn guibg=NONE ctermbg=NONE
]])
  end,
}
