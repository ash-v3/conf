local opts = { noremap = true, silent = true }

-- Move to window using the <meta> movement keys
vim.keymap.set("n", "<A-left>", "<C-w>h", opts)
vim.keymap.set("n", "<A-down>", "<C-w>j", opts)
vim.keymap.set("n", "<A-up>", "<C-w>k", opts)
vim.keymap.set("n", "<A-right>", "<C-w>l", opts)

-- Resize window using <shift> arrow keys
vim.keymap.set("n", "<S-Up>", "<cmd>resize +2<CR>", opts)
vim.keymap.set("n", "<S-Down>", "<cmd>resize -2<CR>", opts)
vim.keymap.set("n", "<S-Left>", "<cmd>vertical resize -2<CR>", opts)
vim.keymap.set("n", "<S-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Move Lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Switch buffers with <ctrl>
-- vim.keymap.set("n", "<C-Left>", "<cmd>bprevious<cr>", opts)
-- vim.keymap.set("n", "<C-Right>", "<cmd>bnext<cr>", opts)

-- Easier pasting
-- vim.keymap.set("n", "[p", ":pu!<cr>", opts)
-- vim.keymap.set("n", "]p", ":pu<cr>", opts)

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", opts)
vim.keymap.set("n", "gw", "*N", opts)
vim.keymap.set("x", "gw", "*N", opts)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true })

-- Add undo break-points
vim.keymap.set("i", ",", ",<c-g>u", opts)
vim.keymap.set("i", ".", ".<c-g>u", opts)
vim.keymap.set("i", ";", ";<c-g>u", opts)

-- better indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- lazygit
vim.keymap.set("n", "<leader>gg", function()
    require("lazy.util").open_cmd({ "lazygit" }, {
        terminal = true,
        close_on_exit = true,
        enter = true,
        float = {
            size = { width = 0.9, height = 0.9 },
            margin = { top = 0, right = 0, bottom = 0, left = 0 },
        },
    })
end, { desc = "Lazygit" })


-- Normal --
-- Better window navigation
-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Resize with arrows
-- vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
-- vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
-- vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
vim.keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
vim.keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)

-- Insert --
-- Press jk fast to exit insert mode
-- vim.keymap.set("i", "jk", "<ESC>", opts)
-- vim.keymap.set("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)
vim.keymap.set("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)

-- Bufferline
-- Move to previous/next
vim.keymap.set("n", "<S-l>", ":BufferPrevious<CR>", opts)
vim.keymap.set("n", "<S-h>", ":BufferNext<CR>", opts)
-- Re-order to previous/next
vim.keymap.set("n", "<A-<>", ":BufferMovePrevious<CR>", opts)
vim.keymap.set("n", "<A->>", ":BufferMoveNext<CR>", opts)
-- Goto buffer in position...
-- vim.keymap.set("n", "<A-1>", ":BufferGoto 1<CR>", opts)
-- vim.keymap.set("n", "<A-2>", ":BufferGoto 2<CR>", opts)
-- vim.keymap.set("n", "<A-3>", ":BufferGoto 3<CR>", opts)
-- vim.keymap.set("n", "<A-4>", ":BufferGoto 4<CR>", opts)
-- vim.keymap.set("n", "<A-5>", ":BufferGoto 5<CR>", opts)
-- vim.keymap.set("n", "<A-6>", ":BufferGoto 6<CR>", opts)
-- vim.keymap.set("n", "<A-7>", ":BufferGoto 7<CR>", opts)
-- vim.keymap.set("n", "<A-8>", ":BufferGoto 8<CR>", opts)
-- vim.keymap.set("n", "<A-9>", ":BufferGoto 9<CR>", opts)
-- vim.keymap.set("n", "<A-0>", ":BufferLast<CR>", opts)
-- Pin/unpin buffer
vim.keymap.set("n", "<Leader>bp", ":BufferPin<CR>", opts)
-- Close buffer
vim.keymap.set("n", "<C-c>", ":BufferClose<CR>", opts)
vim.keymap.set("n", "<Leader>bc", ":BufferCloseAllButCurrentOrPinned<CR>", opts)
vim.keymap.set("n", "<Leader>bf", ":BufferPick<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
-- vim.keymap.set("n", "<C-p>", ":BufferPick<CR>", opts)
-- Sort automatically by...
vim.keymap.set("n", "<Space>bb", ":BufferOrderByBufferNumber<CR>", opts)
vim.keymap.set("n", "<Space>bd", ":BufferOrderByDirectory<CR>", opts)
vim.keymap.set("n", "<Space>bl", ":BufferOrderByLanguage<CR>", opts)
vim.keymap.set("n", "<Space>bw", ":BufferOrderByWindowNumber<CR>", opts)

-- Undo tree
vim.keymap.set("n", "<Leader>un", ":UndotreeToggle<CR>", opts)

-- Hop
vim.keymap.set("n", "<Leader>hw", ":HopWord<CR>", opts)
vim.keymap.set("n", "<Leader>ha", ":HopAnywhere<CR>", opts)
vim.keymap.set("n", "<Leader>hp", ":HopPattern<CR>", opts)

-- Telescope
vim.keymap.set("n", "<Leader>t", ":Telescope<CR>", opts)
vim.keymap.set("n", "<Leader>tf", ":Telescope find_files<CR>", opts)
vim.keymap.set("n", "<Leader>tb", ":Telescope buffers<CR>", opts)
vim.keymap.set("n", "<Leader>tg", ":Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<Leader>tt", ":Telescope treesitter<CR>", opts)
vim.keymap.set("n", "<Leader>tc", ":Telescope commands<CR>", opts)
vim.keymap.set("n", "<Leader>tr", ":Telescope resume<CR>", opts)
vim.keymap.set("n", "<Leader>ts", ":Telescope symbols<CR>", opts)
vim.keymap.set("n", "<Leader>te", ":Telescope file_browser<CR>", opts)
vim.keymap.set("n", "<Leader>te", ":Telescope repo<CR>", opts)
vim.keymap.set("n", "<Leader>tj", ":Telescope git_status<CR>", opts)
vim.keymap.set("n", "<Leader>tk", ":Telescope keymaps<CR>", opts)
vim.keymap.set("n", "<Leader>tu", ":Telescope undo<CR>", opts)
vim.keymap.set("n", "<Leader>tm", ":Telescope media_files<CR>", opts)
vim.keymap.set("n", "<Leader>tl", ":Telescope frecency<CR>", opts)
vim.keymap.set("n", "<Leader>tlr", ":Telescope lsp_references<CR>", opts)
vim.keymap.set("n", "<Leader>tls", ":Telescope lsp_document_symbols<CR>", opts)
vim.keymap.set("n", "<Leader>tlw", ":Telescope lsp_workspace_symbols<CR>", opts)
vim.keymap.set("n", "<Leader>tld", ":Telescope diagnostics<CR>", opts)
vim.keymap.set("n", "<Leader>tgc", ":Telescope git_commits<CR>", opts)
vim.keymap.set("n", "<Leader>tgb", ":Telescope git_bcommits<CR>", opts)
vim.keymap.set("n", "<Leader>tgs", ":Telescope git_status<CR>", opts)

-- Neoformat
vim.keymap.set("n", "<Leader>st", ":Neoformat<CR>", opts)

-- Code action
vim.keymap.set("n", "<Leader>k", ":CodeActionMenu<CR>", opts)

-- Cargo
vim.keymap.set("n", "<Leader>rr", ":!cargo run<CR>", opts)
vim.keymap.set("n", "<Leader>rt", ":!cargo test<CR>", opts)

-- Save and close files
vim.keymap.set("n", "<Leader>w", ":w<CR>", opts)
vim.keymap.set("n", "<Leader>q", ":q<CR>", opts)

-- Nvim tree
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- JABS
vim.keymap.set("n", "<Leader>bs", ":JABSOpen<CR>", opts)

-- Spectre
vim.keymap.set("n", "<Leader>ss", function() require('spectre').open() end, opts)
-- search current word
vim.keymap.set("n", "<Leader>sw", function() require('spectre').open_visual({ select_word = true }) end, opts)
vim.keymap.set("n", "<Leader>sv", function() require('spectre').open_visual() end, opts)
-- search in current file
vim.keymap.set("n", "<Leader>sp", function() require('spectre').open_file_search() end, opts)
-- U to redo
vim.keymap.set("n", "U", "<C-R>", opts)

-- FTerm
vim.keymap.set('n', '<C-t>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<C-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- Sniprun
vim.keymap.set("n", "<Leader>sr", ":SnipRun<CR>", opts)
vim.keymap.set("n", "<Leader>sc", ":SnipReset<CR>", opts)
