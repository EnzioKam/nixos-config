local g = vim.g
g.mapleader = " "

local map = vim.keymap.set

-- Plugin related keybindings
map("n", "<c-n>", ":NvimTreeToggle<CR>")
map("n", "<c-p>", ":CocCommand markdown-preview-enhanced.openPreview<CR>")
map("n", "<leader>wi", "<Plug>VimwikiIndex")

-- fzf-lua
map("n", "<leader>b", "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })
map("n", "<leader>h", "<cmd>lua require('fzf-lua').oldfiles()<CR>", { silent = true })
map("n", "<leader>f", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
map("n", "<leader>l", "<cmd>lua require('fzf-lua').blines()<CR>", { silent = true })

-- gitsigns
-- To be completed: nav_hunks after 24.05
local gitsigns = require("gitsigns")
map("n", "<leader>g", gitsigns.preview_hunk)

-- Navigate windows
map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")

-- Tab keybindings
map("n", "<leader>t", ":tabnew<CR>")

-- Original remappings from vim-better-default at
-- https://github.com/liuchengxu/vim-better-default
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>Q", ":qa!<CR>")
-- Move half page faster
map("n", "<leader>d", "<c-d>")
map("n", "<leader>u", "<c-u>")
-- Bash like
map("i", "<c-a>", "<Home>")
map("i", "<c-e>", "<End>")
map("i", "<c-d>", "<Delete>")
map("n", "<c-a>", "<Home>")
map("n", "<c-e>", "<End>")
map("n", "<c-d>", "<Delete>")
-- jj | escaping
map("i", "jj", "<Esc>")
map("c", "jj", "<c-c>")
-- Quit visual mode
map("v", "v", "<Esc>")
-- Move to start/end of line
map("n", "H", "^")
map("n", "L", "$")
-- Redo
map("n", "U", "<c-r>")
-- Yank to end of line
map("n", "Y", "y$")

-- Buffers
map("n", "<leader>bp", ":bprevious<CR>")
map("n", "<leader>bn", ":bnext<CR>")
map("n", "<leader>bf", ":bfirst<CR>")
map("n", "<leader>bl", ":blast<CR>")
map("n", "<leader>bd", ":bd<CR>")
map("n", "<leader>bk", ":bw<CR>")

-- Moving and navigating windows
map("n", "<leader>ww", "<c-W>w")
map("n", "<leader>wr", "<c-W>r")
map("n", "<leader>wd", "<c-W>c")
map("n", "<leader>wn", ":vnew<CR>")
map("n", "<leader>wm", ":new<CR>")
map("n", "<leader>wq", "<c-W>q")
map("n", "<leader>wh", "<c-W>h")
map("n", "<leader>wj", "<c-W>j")
map("n", "<leader>wk", "<c-W>k")
map("n", "<leader>wl", "<c-W>l")
map("t", "<leader>wh", "<c-W>h")
map("t", "<leader>wj", "<c-W>j")
map("t", "<leader>wk", "<c-W>k")
map("t", "<leader>wl", "<c-W>l")

-- Window sizing
map("n", "<leader>wH", "<c-W>5<")
map("n", "<leader>wL", "<c-W>5>")
map("n", "<leader>wJ", ":resize +5<CR>")
map("n", "<leader>wK", ":resize -5<CR>")
map("n", "<leader>w=", "<c-W>=")

-- Duplicating windows
map("n", "<leader>ws", "<c-W>s")
map("n", "<leader>w-", "<c-W>s")
map("n", "<leader>wv", "<c-W>v")
map("n", "<leader>w2", "<c-W>v")

-- Terminal keybindings
map("t", "<c-]>", "<c-\\><c-n>")
map("n", "<M-t>", ":te<CR>")
map("n", "<M-0>", ":b term<CR>")
map("t", "<c-j><c-k>", "<c-\\><c-N>")
map("t", "<c-h>", "<c-\\><c-N><c-w>h")
map("t", "<c-j>", "<c-\\><c-N><c-w>j")
map("t", "<c-k>", "<c-\\><c-N><c-w>k")
map("t", "<c-l>", "<c-\\><c-N><c-w>l")

