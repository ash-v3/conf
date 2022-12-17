local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "akinsho/bufferline.nvim" })
	use({ "moll/vim-bbye" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/toggleterm.nvim" })
	use({ "ahmedkhalf/project.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({
		"nathom/filetype.nvim",
		config = function()
			require("filetype").setup({})
		end,
	})
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "goolord/alpha-nvim" })
	use({ "folke/which-key.nvim" })

	-- Cmp
	use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer" }) -- buffer completions
	use({ "hrsh7th/cmp-path" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-omni", after = "nvim-cmp" })
	use({ "quangnguyen30192/cmp-nvim-ultisnips", after = { "nvim-cmp", "ultisnips" } })
	use({ "hrsh7th/cmp-emoji", after = "nvim-cmp" })

	-- Snippets
	use({ "L3MON4D3/LuaSnip" }) --snippet engine
	use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use
	use({ "SirVer/ultisnips", event = "InsertEnter" })
	use({ "honza/vim-snippets", after = "ultisnips" })

	-- LSP
	use({ "neovim/nvim-lspconfig" }) -- enable LSP
	use({ "williamboman/mason.nvim" }) -- simple to use language server installer
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
	use({ "RRethy/vim-illuminate" })
	use("alexaandru/nvim-lspupdate")

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })
	-- search emoji and other symbols
	use({ "nvim-telescope/telescope-symbols.nvim", after = "telescope.nvim" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
	})

	-- Git
	use({ "lewis6991/gitsigns.nvim" })

	-- Hop
	use({
		"phaazon/hop.nvim",
		event = "VimEnter",
	})

	-- Searching
	-- Show match number and index for searching
	use({
		"kevinhwang91/nvim-hlslens",
		keys = { { "n", "*" }, { "n", "#" }, { "n", "n" }, { "n", "N" } },
	})
	-- File search, tag search and more
	use({ "Yggdroot/LeaderF", cmd = "Leaderf", run = ":LeaderfInstallCExtension" })

	-- Notifications
	use({
		"rcarriga/nvim-notify",
		event = "BufEnter",
	})

	-- Open browser
	use({ "tyru/open-browser.vim", event = "VimEnter" })

	-- File tags in vim window
	use({ "liuchengxu/vista.vim", cmd = "Vista" })

	-- Automatic insertion and deletion of a pair of characters
	use({ "Raimondi/delimitMate", event = "InsertEnter" })

	-- Comment plugin
	use({ "tpope/vim-commentary", event = "VimEnter" })

	use("mg979/vim-visual-multi")

	use({
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup()
		end,
	})

	use({ "stevearc/dressing.nvim" })

	use({
		"gbprod/yanky.nvim",
	})

	use({ "nvim-zh/better-escape.vim", event = { "InsertEnter" } })

	use({ "sbdchd/neoformat", cmd = { "Neoformat" } })
	-- Handy unix command inside Vim (Rename, Move etc.)
	use({ "tpope/vim-eunuch", cmd = { "Rename", "Delete" } })

	use({ "tpope/vim-fugitive", event = "User InGitRepo", config = [[require('user.fugitive')]] })

	-- Better git log display
	use({ "rbong/vim-flog", requires = "tpope/vim-fugitive", cmd = { "Flog" } })

	use({ "christoomey/vim-conflicted", requires = "tpope/vim-fugitive", cmd = { "Conflicted" } })

	use({ "kevinhwang91/nvim-bqf", ft = "qf", config = [[require('user.bqf')]] })

	-- Another markdown plugin
	use({ "preservim/vim-markdown", ft = { "markdown" } })

	-- Faster footnote generation
	use({ "vim-pandoc/vim-markdownfootnotes", ft = { "markdown" } })

	-- Markdown previewing (only for Mac and Windows)
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		ft = { "markdown" },
	})

	use({ "rhysd/vim-grammarous", ft = { "markdown" } })

	use({ "chrisbra/unicode.vim", event = "VimEnter" })

	-- Additional powerful text object for vim, this plugin should be studied
	-- carefully to use its full power
	use({ "wellle/targets.vim", event = "VimEnter" })

	-- Plugin to manipulate character pairs quickly
	use({ "machakann/vim-sandwich", event = "VimEnter" })

	-- Add indent object for vim (useful for languages like Python)
	use({ "michaeljsmith/vim-indent-object", event = "VimEnter" })

	-- Only use these plugin on Windows and Mac and when LaTeX is installed
	use({ "lervag/vimtex", ft = { "tex" } })

	-- .tmux.conf syntax highlighting and setting check
	use({ "tmux-plugins/vim-tmux", ft = { "tmux" } })

	-- Modern matchit implementation
	use({ "andymass/vim-matchup", event = "VimEnter" })

	use({ "tpope/vim-scriptease", cmd = { "Scriptnames", "Message", "Verbose" } })

	-- Asynchronous command execution
	use({ "skywind3000/asyncrun.vim", opt = true, cmd = { "AsyncRun" } })

	use({ "cespare/vim-toml", ft = { "toml" }, branch = "main" })

	use({ "sakhnik/nvim-gdb", run = { "bash install.sh" }, opt = true, setup = [[vim.cmd('packadd nvim-gdb')]] })

	-- Session management plugin
	use({ "tpope/vim-obsession", cmd = "Obsession" })

	use({ "ojroques/vim-oscyank", cmd = { "OSCYank", "OSCYankReg" } })

	-- The missing auto-completion for cmdline!
	use({ "gelguy/wilder.nvim", opt = true, setup = [[vim.cmd('packadd wilder.nvim')]] })

	-- show and trim trailing whitespaces
	use({ "jdhao/whitespace.nvim", event = "VimEnter" })

	use({ "ii14/emmylua-nvim", ft = "lua" })

	use({ "j-hui/fidget.nvim", after = "nvim-lspconfig", config = [[require('user.fidget-nvim')]] })

	use({
		"mfussenegger/nvim-dap",
		config = function()
			require("user.nvim-dap")
		end,
	})
	use("jbyuki/venn.nvim")
	use({
		"anuvyklack/hydra.nvim",
		config = function()
			require("user.hydra")
		end,
	})
	use("vim-autoformat/vim-autoformat")

	use("folke/trouble.nvim")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/vim-vsnip-integ")
	use("kosayoda/nvim-lightbulb")
	use("m-demare/hlargs.nvim")
	use("weilbith/nvim-code-action-menu")
	use({
		"saecki/crates.nvim",
		config = function()
			require("user.crates")
		end,
	})
	use({
		"neoclide/coc.nvim",
		branch = "release",
		config = function()
			require("user.coc")
		end,
	})
	use({
		"akinsho/git-conflict.nvim",
		config = function()
			require("git-conflict").setup()
		end,
	})

	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		config = function()
			require("dapui").setup()
		end,
	})

	-- Lua
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"simrat39/rust-tools.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("user.rust-tools")
		end,
	})
	use({
		"terror/chatgpt.nvim",
		run = "pip3 install -r requirements.txt",
	})
	use({
		"karb94/neoscroll.nvim",
		event = "VimEnter",
		config = function()
			vim.defer_fn(function()
				require("user.neoscroll")
			end, 2000)
		end,
	})

	use({
		"ray-x/navigator.lua",
		requires = {
			{ "ray-x/guihua.lua", run = "cd lua/fzy && make" },
			{ "neovim/nvim-lspconfig" },
		},
		config = function()
			require("navigator").setup()
		end,
	})

	use({
		"ldelossa/litee.nvim",
		config = function()
			require("litee.lib").setup()
		end,
	})

	use({
		"ray-x/go.nvim",
		config = function()
			require("go").setup()
		end,
	})

	use({
		"potamides/pantran.nvim",
	})
	use("rafamadriz/neon")

	use({
		"romgrk/barbar.nvim",
		wants = "nvim-web-devicons",
		config = function()
			require("bufferline").setup()
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	use({
		"samodostal/image.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("image").setup()
		end,
	})

	use({
		"nvim-neorg/neorg",
		run = ":Neorg sync-parsers", -- This is the important bit!
		config = function()
			require("neorg").setup()
		end,
	})

	use({
		"NFrid/due.nvim",
		config = function()
			require("due_nvim").setup({})
		end,
	})
	use({
		"phaazon/mind.nvim",
		branch = "v2.2",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("mind").setup()
		end,
	})
	use({
		"jghauser/mkdir.nvim",
	})
	use({
		"matbme/JABS.nvim",
		config = function()
			require("jabs").setup()
		end,
	})
	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-python",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/neotest-go",
			"rouge8/neotest-rust",
		},
		config = function()
			require("user.neotest")
		end,
	})
	use({
		"andythigpen/nvim-coverage",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("coverage").setup()
		end,
	})
	use({
		"sudormrfbin/cheatsheet.nvim",

		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("cheatsheet").setup()
		end,
	})
	use({
		"michaelb/sniprun",
		run = "bash ./install.sh",
		config = function()
			require("sniprun").setup()
		end,
	})
	use({
		"declancm/cinnamon.nvim",
		config = function()
			require("cinnamon").setup()
		end,
	})
	use("Xuyuanp/scrollbar.nvim")
	use({
		"filipdutescu/renamer.nvim",
		branch = "master",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("renamer").setup()
		end,
	})
	use({
		"sQVe/sort.nvim",

		-- Optional setup for overriding defaults.
		config = function()
			require("sort").setup({
				-- Input configuration here.
				-- Refer to the configuration section below for options.
			})
		end,
	})
	use("LudoPinelli/comment-box.nvim")
	use("rktjmp/shenzhen-solitaire.nvim")
	use({
		"edluffy/hologram.nvim",
		config = function()
			require("hologram").setup({ auto_display = true })
		end,
	})
	use("ojroques/vim-scrollstatus")
	use({
		"beauwilliams/focus.nvim",
		config = function()
			require("focus").setup()
		end,
	})
	use("lambdalisue/fern.vim")
	use("zsugabubus/crazy8.nvim")

	use({
		"AckslD/nvim-neoclip.lua",
		requires = {
			-- you'll need at least one of these
			-- {'nvim-telescope/telescope.nvim'},
			-- {'ibhagwan/fzf-lua'},
		},
		config = function()
			require("neoclip").setup()
		end,
	})
	use({
		"abecodes/tabout.nvim",
		config = function()
			require("tabout").setup()
		end,
	})
	use("rust-lang/rust.vim")
	use({
		"amrbashir/nvim-docs-view",
		opt = true,
		cmd = { "DocsViewToggle" },
		config = function()
			require("docs-view").setup({
				position = "right",
				width = 60,
			})
		end,
	})
	use("junegunn/vim-easy-align")
	use({
		"ahmedkhalf/jupyter-nvim",
		run = ":UpdateRemotePlugins",
		config = function()
			require("jupyter-nvim").setup({})
		end,
	})
	use({
		"f3fora/cmp-spell",
		config = function()
			require("cmp").setup()
		end,
	})
	use({
		"jiaoshijie/undotree",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("undotree").setup()
		end,
	})
	use({
		"itmecho/neoterm.nvim",
		config = function()
			require("neoterm").setup({
				clear_on_run = true, -- run clear command before user specified commands
				mode = "vertical", -- vertical/horizontal/fullscreen
				noinsert = false,
			})
		end,
	})
	use({
		"Pocco81/AbbrevMan.nvim",
		config = function()
			require("user.abbrev-man")
		end,
	})
	use("morhetz/gruvbox")
	use("folke/tokyonight.nvim")
	use({
		"luukvbaal/nnn.nvim",
		config = function()
			require("nnn").setup()
		end,
	})

	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
