Vim�UnDo� v
�����TҰ9�jB���0���#�ǻb�P�   a         use_telescope = true,            #   #   #   #   !    c��\   - _�                             ����                                                                                                                                                                                                                                                                                                                                       X          v       ctC�     �               X   -- MY RUST SHIT       9-- Set completeopt to have a better completion experience   -- :help completeopt   2-- menuone: popup even when there's only one match   9-- noinsert: Do not insert text until a selection is made   I-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.   /vim.o.completeopt = "menuone,noinsert,noselect"       5-- Avoid showing extra messages when using completion   +vim.opt.shortmess = vim.opt.shortmess + "c"       (local function on_attach(client, buffer)   N  -- This callback is called when the LSP is atttached/enabled for this buffer   3  -- we could set keymaps related to LSP, etc here.   end       0-- Configure LSP through rust-tools.nvim plugin.   D-- rust-tools will configure and enable certain LSP features for us.   @-- See https://github.com/simrat39/rust-tools.nvim#configuration   local opts = {     tools = {       runnables = {         use_telescope = true,       },       inlay_hints = {         auto = true,   #      show_parameter_hints = false,   "      parameter_hints_prefix = "",         other_hints_prefix = "",       },     },       +  -- all the opts to send to nvim-lspconfig   7  -- these override the defaults set by rust-tools.nvim   U  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer     server = {   T    -- on_attach is a callback called when the language server attachs to the buffer       on_attach = on_attach,       settings = {   0      -- to enable rust-analyzer settings visit:   c      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc         ["rust-analyzer"] = {            -- enable clippy on save           checkOnSave = {             command = "clippy",   
        },         },       },     },   }       !require("rust-tools").setup(opts)       -- Setup Completion   >-- See https://github.com/hrsh7th/nvim-cmp#basic-configuration   local cmp = require("cmp")   cmp.setup({   %  preselect = cmp.PreselectMode.None,     snippet = {       expand = function(args)   *      vim.fn["vsnip#anonymous"](args.body)       end,     },     mapping = {   /    ["<C-p>"] = cmp.mapping.select_prev_item(),   /    ["<C-n>"] = cmp.mapping.select_next_item(),       -- Add tab support   1    ["<S-Tab>"] = cmp.mapping.select_prev_item(),   /    ["<Tab>"] = cmp.mapping.select_next_item(),   ,    ["<C-d>"] = cmp.mapping.scroll_docs(-4),   +    ["<C-f>"] = cmp.mapping.scroll_docs(4),   +    ["<C-Space>"] = cmp.mapping.complete(),   $    ["<C-e>"] = cmp.mapping.close(),   $    ["<CR>"] = cmp.mapping.confirm({   ,      behavior = cmp.ConfirmBehavior.Insert,         select = true,       }),     },         -- Installed sources     sources = {       { name = "nvim_lsp" },       { name = "vsnip" },       { name = "path" },       { name = "buffer" },     },   })5��            W                      +
              5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 v       ctC�    �                   �               5��                    W                      +
      5�_�                    -       ����                                                                                                                                                                                                                                                                                                                                                             c���     �   -   3   X    �   -   .   X    5��    -                      /              �       5�_�                    .        ����                                                                                                                                                                                                                                                                                                                                                             c���     �   -   /   ]      allFeatures = true,5��    -                      /                     5�_�                    .        ����                                                                                                                                                                                                                                                                                                                                                             c���     �   -   /   ]        allFeatures = true,5��    -                     /                    5�_�                    .        ����                                                                                                                                                                                                                                                                                                                                                             c���     �   -   /   ]          allFeatures = true,5��    -                     /                    5�_�                    .        ����                                                                                                                                                                                                                                                                                                                                                             c���     �   -   /   ]            allFeatures = true,5��    -                     /                    5�_�      	              .        ����                                                                                                                                                                                                                                                                                                                                                             c���     �   -   /   ]              allFeatures = true,5��    -                  
   /             
       5�_�      
           	   .        ����                                                                                                                                                                                                                                                                                                                                                             c���     �   -   /   ]                allFeatures = true,5��    -           
          /      
              5�_�   	              
   .        ����                                                                                                                                                                                                                                                                                                                                                             c���     �   -   /   ]                  allFeatures = true,5��    -                  
   /             
       5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                             c���    �       ^       ]   -- MY RUST SHIT       9-- Set completeopt to have a better completion experience   -- :help completeopt   2-- menuone: popup even when there's only one match   9-- noinsert: Do not insert text until a selection is made   I-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.   /vim.o.completeopt = "menuone,noinsert,noselect"       5-- Avoid showing extra messages when using completion   +vim.opt.shortmess = vim.opt.shortmess + "c"       (local function on_attach(client, buffer)   N  -- This callback is called when the LSP is atttached/enabled for this buffer   3  -- we could set keymaps related to LSP, etc here.   end       0-- Configure LSP through rust-tools.nvim plugin.   D-- rust-tools will configure and enable certain LSP features for us.   @-- See https://github.com/simrat39/rust-tools.nvim#configuration   local opts = {     tools = {       runnables = {         use_telescope = true,       },       inlay_hints = {         auto = true,   #      show_parameter_hints = false,   "      parameter_hints_prefix = "",         other_hints_prefix = "",       },     },       +  -- all the opts to send to nvim-lspconfig   7  -- these override the defaults set by rust-tools.nvim   U  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer     server = {   T    -- on_attach is a callback called when the language server attachs to the buffer       on_attach = on_attach,       settings = {   0      -- to enable rust-analyzer settings visit:   c      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc         ["rust-analyzer"] = {            -- enable clippy on save           checkOnSave = {             allFeatures = true,   #                overrideCommand = {   N                    'cargo', 'clippy', '--workspace', '--message-format=json',   5                    '--all-targets', '--all-features'                   }             command = "clippy",   
        },         },       },     },   }       !require("rust-tools").setup(opts)       -- Setup Completion   >-- See https://github.com/hrsh7th/nvim-cmp#basic-configuration   local cmp = require("cmp")   cmp.setup({   %  preselect = cmp.PreselectMode.None,     snippet = {       expand = function(args)   *      vim.fn["vsnip#anonymous"](args.body)       end,     },     mapping = {   /    ["<C-p>"] = cmp.mapping.select_prev_item(),   /    ["<C-n>"] = cmp.mapping.select_next_item(),       -- Add tab support   1    ["<S-Tab>"] = cmp.mapping.select_prev_item(),   /    ["<Tab>"] = cmp.mapping.select_next_item(),   ,    ["<C-d>"] = cmp.mapping.scroll_docs(-4),   +    ["<C-f>"] = cmp.mapping.scroll_docs(4),   +    ["<C-Space>"] = cmp.mapping.complete(),   $    ["<C-e>"] = cmp.mapping.close(),   $    ["<CR>"] = cmp.mapping.confirm({   ,      behavior = cmp.ConfirmBehavior.Insert,         select = true,       }),     },         -- Installed sources     sources = {       { name = "nvim_lsp" },       { name = "vsnip" },       { name = "path" },       { name = "buffer" },     },   })5��    .                  
   M             
       �    /                     k                    �    0                     �                    �    1                  
   �             
       5�_�                    2       ����                                                                                                                                                                                                                                                                                                                                                             c���     �   1   3   ]                }5��    1                     �                     5�_�                    2       ����                                                                                                                                                                                                                                                                                                                                                             c���    �   1   3   ]                }.5��    1                    �                    5�_�                    3   
    ����                                                                                                                                                                                                                                                                                                                                                             c���   	 �   2   4   ]                command = "clippy",5��    2   
                  �                     �    2   
                 �                    �    2   
                 �                    5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             c��P    �         ]            auto = true,5��                         �                     �                         �                     �                         �                     �                        �                    �                         �                     �                        �                    �                         �                     �                         �                     �                        �                    �                         �                     �                         �                     �                         �                     �                        �                    �                         �                     �                         �                     �                         �                     �                         �                     �                        �                    �                         �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             c��n    �         ]            auto = false,5��                        �                    �                        �                    �                        �                    �                        �                    �                         �                     5�_�                       2    ����                                                                                                                                                                                                                                                                                                                                                             c��*     �         ]    �         ]    5��                          W              �       5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             c��-    �       a       `   -- MY RUST SHIT       9-- Set completeopt to have a better completion experience   -- :help completeopt   2-- menuone: popup even when there's only one match   9-- noinsert: Do not insert text until a selection is made   I-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.   /vim.o.completeopt = "menuone,noinsert,noselect"       5-- Avoid showing extra messages when using completion   +vim.opt.shortmess = vim.opt.shortmess + "c"       (local function on_attach(client, buffer)   N  -- This callback is called when the LSP is atttached/enabled for this buffer   3  -- we could set keymaps related to LSP, etc here.   Z      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })         -- Code action groups   b      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })   end       0-- Configure LSP through rust-tools.nvim plugin.   D-- rust-tools will configure and enable certain LSP features for us.   @-- See https://github.com/simrat39/rust-tools.nvim#configuration   local opts = {     tools = {       runnables = {         use_telescope = true,       },       inlay_hints = {         auto = true,   #      show_parameter_hints = false,   "      parameter_hints_prefix = "",         other_hints_prefix = "",       },     },       +  -- all the opts to send to nvim-lspconfig   7  -- these override the defaults set by rust-tools.nvim   U  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer     server = {   T    -- on_attach is a callback called when the language server attachs to the buffer       on_attach = on_attach,       settings = {   0      -- to enable rust-analyzer settings visit:   c      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc         ["rust-analyzer"] = {            -- enable clippy on save           checkOnSave = {             allFeatures = true,             overrideCommand = {   F            'cargo', 'clippy', '--workspace', '--message-format=json',   -            '--all-targets', '--all-features'             },              -- command = "clippy",   
        },         },       },     },   }       !require("rust-tools").setup(opts)       -- Setup Completion   >-- See https://github.com/hrsh7th/nvim-cmp#basic-configuration   local cmp = require("cmp")   cmp.setup({   %  preselect = cmp.PreselectMode.None,     snippet = {       expand = function(args)   *      vim.fn["vsnip#anonymous"](args.body)       end,     },     mapping = {   /    ["<C-p>"] = cmp.mapping.select_prev_item(),   /    ["<C-n>"] = cmp.mapping.select_next_item(),       -- Add tab support   1    ["<S-Tab>"] = cmp.mapping.select_prev_item(),   /    ["<Tab>"] = cmp.mapping.select_next_item(),   ,    ["<C-d>"] = cmp.mapping.scroll_docs(-4),   +    ["<C-f>"] = cmp.mapping.scroll_docs(4),   +    ["<C-Space>"] = cmp.mapping.complete(),   $    ["<C-e>"] = cmp.mapping.close(),   $    ["<CR>"] = cmp.mapping.confirm({   ,      behavior = cmp.ConfirmBehavior.Insert,         select = true,       }),     },         -- Installed sources     sources = {       { name = "nvim_lsp" },       { name = "vsnip" },       { name = "path" },       { name = "buffer" },     },   })5��                         W                    �                         �                    �                         �                    5�_�                    =       ����                                                                                                                                                                                                                                                                                                                                                             c��{    �   <   >   `      !require("rust-tools").setup(opts)5��    <                                          �    <                                        �    <                                          5�_�                    =        ����                                                                                                                                                                                                                                                                                                                            =          =           v        c��~    �   <   >   `      #require("rust-tools")rt.setup(opts)5��    <                      �                     5�_�                           ����                                                                                                                                                                                                                                                                                                                            =          =           v        c�Ջ    �         `    5��                                                5�_�                            ����                                                                                                                                                                                                                                                                                                                            >          >           v        c�Ռ    �         a       �         a    5��                                                5�_�                           ����                                                                                                                                                                                                                                                                                                                            >          >           v        c�Վ    �                 -- MY RUST SHIT5��                                                  5�_�                            ����                                                                                                                                                                                                                                                                                                                            =          =           v        c�Ց    �          `      require("rust-tools")5��                                                  �                                                �                                                �                                                �                                                �                                              �                                                �                                              �                                              5�_�                       S    ����                                                                                                                                                                                                                                                                                                                            =          =           v        c��4    �         `      V  vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })5��       R                  �                     �       Q                  �                     �       P                 �                    �       P                  �                     �       O                  �                     �       N                 �                    �       Q                  �                     �       P                  �                     �       O                  �                     �       N                 �                    �       R                  �                     �       Q                  �                     �       P                  �                     �       O                  �                     �       N                 �                    �       S                  �                     �       R                  �                     �       Q                  �                     �       P                  �                     �       O                  �                     �       N                 �                    5�_�                       V    ����                                                                                                                                                                                                                                                                                                                            =          =           v        c��9    �         `      ^  vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })5��       V                  .                     5�_�                       V    ����                                                                                                                                                                                                                                                                                                                            =          =           v        c��:    �         `      Y  vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer =  })5��       V                  .                     �       V                 .                    �       V                 .                    �       V                 .                    �       V                 .                    �       V                 .                    �       V                 .                    �       \                  4                     5�_�                    >        ����                                                                                                                                                                                                                                                                                                                                                             c��     �   =   ?   `       5��    =                      !                     �    =                     !                    5�_�                     >       ����                                                                                                                                                                                                                                                                                                                                                             c��   ! �   >   @   `    �   >   ?   `    5��    >                      %                     5�_�      !               ?        ����                                                                                                                                                                                                                                                                                                                                                             c��   # �   =   ?   a      rt.   runnables.runnables()�   >   @   a      runnables.runnables()5��    =                     $                     5�_�       #           !   >       ����                                                                                                                                                                                                                                                                                                                                                             c��   - �   >   @   `    5��    >                      :                     5�_�   !       "       #          ����                                                                                                                                                                                                                                                                                                                                                             c��\   + �         a            use_telescope = false,5��                         :                     �                         9                     �                         8                     �                        7                    �                         8                     �                        7                    �                         9                     �                         8                     �                        7                    �                         :                     �                         9                     �                         8                     �                        7                    �                         ;                     �                         :                     �                         9                     �                         8                     �                        7                    �                         <                     5�_�   !           #   "          ����                                                                                                                                                                                                                                                                                                                                                             c��:   ' �         a            use_telescope = false,5��                        7                    �                        7                    �                        7                    �                        7                    �                        7                    �                         <                     5�_�                           ����                                                                                                                                                                                                                                                                                                                            =          =           v        c�Ո    �         `    �          `      $-require("rust-tools")- MY RUST SHIT5��                                                5�_�                            ����                                                                                                                                                                                                                                                                                                                            =          =           v        c�Ճ    �         `    �         `      require("rust-tools")5��                          �                     5��