local g = vim.g
g.mapleader = " "

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Plugin related keybindings
map("n", "<C-n>", ":NvimTreeToggle<CR>")
map("n", "<leader>b", ":FzfLua buffers<CR>")
map("n", "<leader>h", ":FzfLua oldfiles<CR>")
map("n", "<leader>f", ":FzfLua files<CR>")
map("n", "<leader>l", ":FzfLua blines<CR>")
-- map("n", "<leader>e", ":LspDiagnostics 0<CR>")
-- map("n", "<leader>]", "<cmd>lua vim.lsp.buf.definition()<CR>",
--     {noremap = true, silent = true})
-- map("n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<CR>",
--     {noremap = true, silent = true})
-- map("n", "<leader>r", "<cmd>lua vim.lsp.buf.references()<CR>",
--     {noremap = true, silent = true})
-- map("n", "<leader>s", "<cmd>lua vim.lsp.buf.document_symbol()<CR>",
--     {noremap = true, silent = true})
map('n', "<leader>t", "<cmd>lua require(\"FTerm\").toggle()<CR>")
map('t', "<leader>t", "<C-\\><C-n><cmd>lua require(\"FTerm\").toggle()<CR>")

-- Preview Markdown (COC)
map("n", "<C-p>", ":CocCommand markdown-preview-enhanced.openPreview<CR>")

-- Navigate windows
map("n", "<C-h>", "<C-w>h", {noremap = true})
map("n", "<C-j>", "<C-w>j", {noremap = true})
map("n", "<C-k>", "<C-w>k", {noremap = true})
map("n", "<C-l>", "<C-w>l", {noremap = true})

-- Original remappings from vim-better-default at
-- https://github.com/liuchengxu/vim-better-default
map("n", "<leader>q", ":q<CR>", {noremap = true})
map("n", "<leader>Q", ":qa!<CR>", {noremap = true})
-- Move half page faster
map("n", "<leader>d", "<C-d>", {noremap = true})
map("n", "<leader>u", "<C-u>", {noremap = true})
-- Bash like
map("i", "<C-a>", "<Home>", {noremap = true})
map("i", "<C-e>", "<End>", {noremap = true})
map("i", "<C-d>", "<Delete>", {noremap = true})
map("n", "<C-a>", "<Home>", {noremap = true})
map("n", "<C-e>", "<End>", {noremap = true})
map("n", "<C-d>", "<Delete>", {noremap = true})
-- jj | escaping
map("i", "jj", "<Esc>", {noremap = true})
map("c", "jj", "<C-c>", {noremap = true})
-- Quit visual mode
map("v", "v", "<Esc>", {noremap = true})
-- Move to start/end of line
map("n", "H", "^", {noremap = true})
map("n", "L", "$", {noremap = true})
-- Redo
map("n", "U", "<C-r>", {noremap = true})
-- Yank to end of line
map("n", "Y", "y$", {noremap = true})

-- Buffers
map("n", "<leader>bp", ":bprevious<CR>", {noremap = true})
map("n", "<leader>bn", ":bnext<CR>", {noremap = true})
map("n", "<leader>bf", ":bfirst<CR>", {noremap = true})
map("n", "<leader>bl", ":blast<CR>", {noremap = true})
map("n", "<leader>bd", ":bd<CR>", {noremap = true})
map("n", "<leader>bk", ":bw<CR>", {noremap = true})
-- Moving and navigating windows
map("n", "<leader>ww", "<C-W>w", {noremap = true})
map("n", "<leader>wr", "<C-W>r", {noremap = true})
map("n", "<leader>wd", "<C-W>c", {noremap = true})
map("n", "<leader>wn", ":vnew<CR>", {noremap = true})
map("n", "<leader>wm", ":new<CR>", {noremap = true})
map("n", "<leader>wq", "<C-W>q", {noremap = true})
map("n", "<leader>wh", "<C-W>h", {noremap = true})
map("n", "<leader>wj", "<C-W>j", {noremap = true})
map("n", "<leader>wk", "<C-W>k", {noremap = true})
map("n", "<leader>wl", "<C-W>l", {noremap = true})
map("t", "<leader>wh", "<C-W>h", {noremap = true})
map("t", "<leader>wj", "<C-W>j", {noremap = true})
map("t", "<leader>wk", "<C-W>k", {noremap = true})
map("t", "<leader>wl", "<C-W>l", {noremap = true})
-- Window sizing
map("n", "<leader>wH", "<C-W>5<", {noremap = true})
map("n", "<leader>wL", "<C-W>5>", {noremap = true})
map("n", "<leader>wJ", ":resize +5<CR>", {noremap = true})
map("n", "<leader>wK", ":resize -5<CR>", {noremap = true})
map("n", "<leader>w=", "<C-W>=", {noremap = true})
-- Duplicating windows
map("n", "<leader>ws", "<C-W>s", {noremap = true})
map("n", "<leader>w-", "<C-W>s", {noremap = true})
map("n", "<leader>wv", "<C-W>v", {noremap = true})
map("n", "<leader>w2", "<C-W>v", {noremap = true})

-- Terminal keybindings
map("t", "<C-]>", "<C-\\><C-n>", {noremap = true})
map("n", "<M-t>", ":te<CR>", {noremap = true})
map("n", "<M-0>", ":b term<CR>", {noremap = true})
map("t", "<C-j><C-k>", "<C-\\><C-N>", {noremap = true})
map("t", "<C-h>", "<C-\\><C-N><C-w>h", {noremap = true})
map("t", "<C-j>", "<C-\\><C-N><C-w>j", {noremap = true})
map("t", "<C-k>", "<C-\\><C-N><C-w>k", {noremap = true})
map("t", "<C-l>", "<C-\\><C-N><C-w>l", {noremap = true})

