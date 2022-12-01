local rt = require("rust-tools")

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.o.completeopt = "menuone,noinsert,noselect"

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"

local function on_attach(client, buffer)
  -- This callback is called when the LSP is atttached/enabled for this buffer
  -- we could set keymaps related to LSP, etc here.
  vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = buffer })
  -- Code action groups
  vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = buffer })

  vim.keymap.set("n", "<Leader>ar", rt.runnables.runnables, { buffer = buffer })
end

local opts = {tools = {
		runnables = {
			use_telescope = true,
		},
		inlay_hints = {
			auto = true,
			-- whether to show parameter hints with the inlay hints or not
			-- default: true
			show_parameter_hints = true,
		},
	},
	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
	server = {
		on_attach = on_attach,
		-- on_attach is a callback called when the language server attachs to the buffer
		settings = {
			-- to enable rust-analyzer settings visit:
			-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
			["rust-analyzer"] = {
				-- enable clippy on save
				checkOnSave = {
					allFeatures = true,
					overrideCommand = {
						"cargo",
						"clippy",
						"--workspace",
						"--message-format=json",
						"--all-targets",
						"--all-features",
					},
				},
			},
		},
	},
}

rt.setup(opts)
rt.setup(opts)
rt.inlay_hints.enable()
