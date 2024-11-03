return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "tailwindcss", "cssls", "rust_analyzer", "gopls" },
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            -- Configuration des serveurs LSP
            lspconfig.cssls.setup({
                capabilities = capabilities,
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities
            })
            lspconfig.gopls.setup({
                capabilities = capabilities
            })
            -- Mappages de touches LSP

            local format = function()
                vim.lsp.buf.format({
                    filter = function(client) return client.name ~= "ts_ls" end })
            end
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation LSP" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action LSP" })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to Definition LSP" })
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to References LSP" })
            vim.keymap.set("n", "<leader>gf", format, { desc = "Format File LSP" })
            vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
        end,
    },
}
