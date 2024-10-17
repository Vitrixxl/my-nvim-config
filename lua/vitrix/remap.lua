vim.g.mapleader = " "

vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")

-- vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
-- vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
-- vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
-- vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

--Move line up and down
vim.keymap.set("n", '<C-k>', ":m-2<CR>")
vim.keymap.set("n", '<C-j>', ":m+1<CR>")

--Change around
local function changeAround()
  local prev = vim.fn.input("Enter character to replace: ")
  if #prev > 2 then
    error("Error you can put max 2 char")
  end
  local next = vim.fn.input("Enter new character: ")

  if #next > 2 then
    error("Error you can put max 2 char")
  end

  if #prev > 1 then
    local fPrev = string.sub(prev, 1, 1)
    local sPrev = string.sub(prev, 2, 2)

    if #next > 1 then
      local fNext = string.sub(next, 1, 1)
      local sNext = string.sub(next, 2, 2)
      vim.api.nvim_command("normal! f" .. fPrev .. "r" .. fNext .. "f" .. sPrev .. "r" .. sNext)
    else
      vim.api.nvim_command("normal! f" .. fPrev .. "r" .. next .. "f" .. sPrev .. "r" .. next)
    end
  end
  vim.api.nvim_command("normal! f" .. prev .. "r" .. next .. "f" .. prev .. "r" .. next)
end


vim.keymap.set("n", "<leader>vca", changeAround)

--Insert around

--Delete around


vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
