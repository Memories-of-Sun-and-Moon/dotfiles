return {
	"catppuccin/nvim",
	opts = {
		name = "catppuccin", 
		background = {
			light = "frappe",
			dark = "mocha",
		}
	},
	config = function()
		vim.cmd[[colorscheme catppuccin]]
	end
}
