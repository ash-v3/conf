local configs = {
	"cmp",
	"lsp",
	"telescope",
	"gitsigns",
	"treesitter",
	"autopairs",
	"comment",
	"nvim-tree",
	"bufferline",
	"lualine",
	"toggleterm",
	"project",
	"impatient",
	"indentline",
	"alpha",
	"whichkey",
}
local config_base_dir = "user."

require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.colorscheme")
require("user.autocommands")

for _, file in ipairs(configs) do
	require(config_base_dir .. file)
end
