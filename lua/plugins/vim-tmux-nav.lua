return{
  "christoomey/vim-tmux-navigator",
  vim.keymap.set("n","C-h",":TmuxNavigateLeft<CR>"),
  vim.keymap.set("n","C-j",":TmuxNavigateBottom<CR>"),
  vim.keymap.set("n","C-k",":TmuxNavigateTop<CR>"),
  vim.keymap.set("n","C-l",":TmuxNavigateRight<CR>"),
}
