return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
   local builtin = require('telescope.builtin')

   vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "find files TELESCOPE" })
   vim.keymap.set('n', '<C-p>', builtin.live_grep, { desc = "grep codebase TELESCOPE" })
  end,
}