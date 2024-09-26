return {
	"catppuccin/nvim",
	config = function()
		require("catppuccin").setup({
			flavor = "mocha",
		})
    vim.cmd.colorscheme "catppuccin-mocha"
	end,
}
