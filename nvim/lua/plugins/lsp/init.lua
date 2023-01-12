local servers = require("plugins.lsp.servers")

local function on_attach(client, bufnr)
    require("plugins.lsp.format").on_attach(client, bufnr)
    require("plugins.lsp.keymaps").on_attach(client, bufnr)
end

return {
    -- lspconfig
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        dependencies = {
            { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
            { "folke/neodev.nvim", config = true },
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            -- "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            -- diagnostics
            for name, icon in pairs(require("config.icons").diagnostics) do
                name = "DiagnosticSign" .. name
                vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
            end
            vim.diagnostic.config({
                underline = true,
                update_in_insert = false,
                virtual_text = { spacing = 4, prefix = "●" },
                severity_sort = true,
            })

            -- lspconfig
            -- local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
            for server, opts in pairs(servers) do
                -- opts.capabilities = capabilities
                opts.on_attach = on_attach
                require("lspconfig")[server].setup(opts)
            end
        end,
    },

    -- formatters
    -- {
    --   "jose-elias-alvarez/null-ls.nvim",
    --   event = "BufReadPre",
    --   config = function()
    --     local nls = require("null-ls")
    --     nls.setup({
    --       on_attach = on_attach,
    --       sources = {
    --         -- nls.builtins.formatting.prettierd,
    --         nls.builtins.formatting.stylua,
    --         nls.builtins.diagnostics.flake8,
    --       },
    --     })
    --   end,
    -- },

    {
        "SmiteshP/nvim-navic",
        event = "VeryLazy",
        config = function()
            vim.g.navic_silence = true
            require("nvim-navic").setup({ separator = " ", highlight = true, depth_limit = 5 })
        end,
    },

    -- {
    --   "ThePrimeagen/refactoring.nvim",
    --   keys = {
    --     {
    --       "<leader>r",
    --       function()
    --         require("refactoring").select_refactor()
    --       end,
    --       mode = "v",
    --       noremap = true,
    --       silent = true,
    --       expr = false,
    --     },
    --   },
    --   config = {
    --     require('refactoring').setup({})
    --   },
    -- },

    {
        "simrat39/symbols-outline.nvim",
        keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
        config = true,
    },

    {
        "danymat/neogen",
        cmd = "Neogen",
        keys = {
            {
                "<leader>cc",
                function()
                    require("neogen").generate({})
                end,
                desc = "Neogen Comment",
            },
        },
        config = { snippet_engine = "luasnip" },
    },

    {
        "m-demare/hlargs.nvim",
        event = "VeryLazy",
        enabled = false,
        config = {
            excluded_argnames = {
                usages = {
                    lua = { "self", "use" },
                },
            },
        },
    },

    {
        "kevinhwang91/nvim-hlslens",
        keys = { { "n", "*" }, { "n", "#" }, { "n", "n" }, { "n", "N" } },
        config = function()
            require("hlslens").setup()
        end,
    },

    -- File search, tag search and more -- unncessesary
    -- { "Yggdroot/LeaderF", cmd = "Leaderf", run = ":LeaderfInstallCExtension" },

    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufReadPre",
        config = true,
    },

    -- { "tpope/vim-endwise", event = "VeryLazy" },
    -- { "rstacruz/vim-closer", event = "VeryLazy" },

    { "sbdchd/neoformat", cmd = { "Neoformat" } },

    { "kevinhwang91/nvim-bqf", ft = "qf", config = true },

    { "folke/lsp-colors.nvim", lazy = false, config = function()
        require("lsp-colors").setup()
    end
    }
}
