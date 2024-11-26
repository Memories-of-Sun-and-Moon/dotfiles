vim.loader.enable()
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.number = true

require("lazy").setup({
	"nvim-treesitter/nvim-treesitter",
	{
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd[[colorscheme tokyonight]]
		end
	}
})
  
require'nvim-treesitter.configs'.setup {
	ensure_installed = {"cpp", "lua", "markdown" },
	auto_install = true,
}

