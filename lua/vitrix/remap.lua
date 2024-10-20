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
-- Fonction pour créer une nouvelle fenêtre flottante avec un message
-- Fonction pour créer une nouvelle fenêtre flottante avec une bordure arrondie
local function open_message_window()
  -- Récupérer la taille actuelle de l'écran
  local total_width = vim.o.columns
  local total_height = vim.o.lines

  -- Calculer les dimensions de la fenêtre en soustrayant une marge de 20 colonnes et lignes
  local width = total_width - 20
  local height = total_height - 20

  -- Calculer la position pour centrer la fenêtre
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Définir des caractères Unicode pour la bordure arrondie
  local rounded_border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

  -- Créer une nouvelle fenêtre flottante
  local buf = vim.api.nvim_create_buf(false, true) -- Crée un buffer non listé
  vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal',
    border = rounded_border
  })

  -- Écrire un message dans la fenêtre
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "Hello, Neovim!", "Ton message ici!" })
end

-- Créer une commande pour ouvrir la fenêtre
vim.api.nvim_create_user_command('ShowMessage', open_message_window, {})
-- Fonction pour créer une fenêtre flottante avec un titre dans la bordure
-- Fonction pour créer une fenêtre flottante avec un titre (dans le contenu, pas dans la bordure)
local function open_window_with_title_in_content()
  -- Récupérer la taille de l'écran
  local total_width = vim.o.columns
  local total_height = vim.o.lines

  -- Dimensions de la fenêtre
  local width = total_width - 20     -- Largeur ajustée pour la marge
  local height = total_height - 10   -- Hauteur ajustée pour la marge
  local row = math.floor((total_height - height) / 2)
  local col = math.floor((total_width - width) / 2)

  -- Créer un buffer pour la fenêtre flottante
  local buf = vim.api.nvim_create_buf(false, true)   -- Créer un buffer non listé
  vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal',
    border = 'single'     -- Utiliser une bordure simple
  })

  -- Ajouter le titre comme première ligne du contenu
  local title = " Mon Titre Personnalisé "
  local separator = string.rep("─", math.floor((width - #title) / 2)) -- Centrer le titre
  local title_line = separator .. title .. separator

  -- Ajouter le titre et le contenu dans le buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
    title_line,     -- La première ligne contient le titre centré
    "",             -- Ligne vide pour espacer
    "Contenu de la fenêtre flottante ici..."
  })
end

-- Créer une commande pour ouvrir la fenêtre avec un titre dans le contenu
vim.api.nvim_create_user_command('ShowWindowWithTitle', open_window_with_title_in_content, {})


vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
