-- nvim-treesitter の設定上で、markdown と markdown_inline のパーサーをインストールするように指定してあげる必要がある
return {
	'MeanderingProgrammer/render-markdown.nvim',
	main = "render-markdown",
	dependencies = { 'nvim-treesitter/nvim-treesitter'},
	---@module 'render-markdown'
	---@type render.md.UserConfig
	ft = { "markdown" }, 
	opts = {},
}
