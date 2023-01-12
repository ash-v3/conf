local M = {
    -- main one
    { 'ms-jpq/coq_nvim', event = "VeryLazy", branch = 'coq' },
    -- 9000+ Snippets
    { 'ms-jpq/coq.artifacts', event = "VeryLazy", dependencies = "ms-jpq/coq_nvim", branch = 'artifacts' },

    -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
    -- Need to **configure separately**

    { 'ms-jpq/coq.thirdparty', event = "VeryLazy", dependencies = "ms-jpq/coq_nvim", branch = "3p",
        config = function() require("coq_3p") {
                { src = "nvimlua", short_name = "nLUA" },
                { src = "vimtex", short_name = "vTEX" },
                { src = "builtin/c" },
                { src = "builtin/html" },
                { src = "dap" },
                {
                    src = "repl",
                    sh = "fish",
                }
            }
        end },

    { "cohama/lexima.vim", event = "VeryLazy" }

    -- - shell repl
    -- - nvim lua api
    -- - scientific calculator
    -- - comment banner
    -- - etc

    -- {
    --     "windwp/nvim-autopairs",
    --     event = "VeryLazy",
    --     dependencies = "ms-jpq/coq_nvim",
    --     config = function()
    --         local remap = vim.api.nvim_set_keymap
    --         local npairs = require('nvim-autopairs')
    --         local Rule = require("nvim-autopairs.rule")
    --         local cond = require("nvim-autopairs.conds")
    --
    --         npairs.setup({ map_bs = false, map_cr = false, check_ts = true })
    --
    --         -- these mappings are coq recommended mappings unrelated to nvim-autopairs
    --         remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
    --         remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
    --         remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
    --         remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })
    --
    --         -- skip it, if you use another global object
    --         _G.MUtils = {}
    --
    --         MUtils.CR = function()
    --             if vim.fn.pumvisible() ~= 0 then
    --                 if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
    --                     return npairs.esc('<c-y>')
    --                 else
    --                     return npairs.esc('<c-e>') .. npairs.autopairs_cr()
    --                 end
    --             else
    --                 return npairs.autopairs_cr()
    --             end
    --         end
    --         remap('i', '<C-CR>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })
    --
    --         MUtils.BS = function()
    --             if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
    --                 return npairs.esc('<c-e>') .. npairs.autopairs_bs()
    --             else
    --                 return npairs.autopairs_bs()
    --             end
    --         end
    --         remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
    --
    --         require("nvim-autopairs").setup {}
    --     end
    -- },
}

vim.g.coq_settings = {
    auto_start = "shut-up",
    keymap = {
        recommended = true,
    },
    clients = {
        paths = {
            path_seps = {
                "/"
            }
        },
        buffers = {
            match_syms = true
        }
    },
    display = {
        ghost_text = {
            enabled = true
        }
    }
}

return {}
