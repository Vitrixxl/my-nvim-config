vim.g.mapleader = " "

vim.keymap.set("n","<leader>o","o<Esc>")
vim.keymap.set("n","<leader>O","O<Esc>")

vim.keymap.set("n","<C-j>",":wincmd j<CR>")
vim.keymap.set("n","<C-k>",":wincmd k<CR>")
vim.keymap.set("n","<C-h>",":wincmd h<CR>")
vim.keymap.set("n","<C-l>",":wincmd l<CR>")


vim.keymap.set('n','<leader>pv',vim.cmd.Ex)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
