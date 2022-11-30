local set = vim.opt -- global options
local cmd = vim.cmd -- execute Vim commands
-- local fn    = vim.fn            -- call Vim functions
-- local g = vim.g -- global variables
-- local b     = vim.bo            -- buffer-scoped options
-- local w     = vim.wo            -- windows-scoped options

set.guifont = "JetBrains Mono"
set.termguicolors = true -- Enable GUI colors for the terminal to get truecolor
set.list = false -- show whitespace
set.undofile = true
set.undodir = vim.fn.stdpath("config") .. "/undo"
set.clipboard = set.clipboard + "unnamedplus" -- copy & paste
set.wrap = true -- wrap
set.showmatch = true -- show the matching part of the pair for [] {} and ()
set.cursorline = true -- highlight current line
set.number = true -- show line numbers
set.relativenumber = true -- show relative line number
set.incsearch = true -- incremental search
set.hlsearch = true -- highlighted search results
set.ignorecase = true -- ignore case sensetive while searching
set.smartcase = true
set.scrolloff = 1 -- when scrolling, keep cursor 1 lines away from screen border
set.sidescrolloff = 2 -- keep 30 columns visible left and right of the cursor at all times
set.backspace = "indent,start,eol" -- make backspace behave like normal again
set.mouse = "a" -- turn on mouse interaction
set.updatetime = 500 -- CursorHold interval
set.expandtab = true
set.softtabstop = 2
-- set.textwidth = 100
set.shiftwidth = 2 -- spaces per tab (when shifting), when using the >> or << commands, shift lines by 4 spaces
set.tabstop = 2 -- spaces per tab
set.smarttab = true -- <tab>/<BS> indent/dedent in leading whitespace
set.autoindent = true -- maintain indent of current line
set.shiftround = true
set.splitbelow = true -- open horizontal splits below current window
set.splitright = true -- open vertical splits to the right of the current window
set.laststatus = 2 -- always show status line
-- set.colorcolumn = "79"        -- vertical word limit line

set.hidden = true -- allows you to hide buffers with unsaved changes without being prompted
set.inccommand = "split" -- live preview of :s results
set.shell = "fish" -- shell to use for `!`, `:!`, `system()` etc.

cmd("set wildmode=longest,list") -- bash-like tab completions
cmd("filetype plugin indent on") --allow auto-indenting based on file type
cmd("filetype plugin on")
cmd("syntax on")
set.ttyfast = true
set.spell = true
cmd("syntax enable")

set.backup = true

set.autowrite = true
set.undofile = true
set.spelllang = "en"

set.virtualedit = "block"
