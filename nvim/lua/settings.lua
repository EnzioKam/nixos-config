local cmd = vim.cmd  -- to execute Vim commands e.g. cmd("pwd")
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

require("catppuccin").setup({
  integrations = {
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false
    }
  }
})
require("gitsigns").setup()
require("nvim_comment").setup({
  line_mapping = ";;",
  operator_mapping = ";"
})
require("nvim-tree").setup()
require('lualine').setup {
  options = {
    theme = "catppuccin",
    icons_enable = true
  }
}
require("nvim-autopairs").setup()
require("FTerm").setup({
  dimensions = {height = 0.6, width = 0.6}
})

cmd.colorscheme "catppuccin"

opt.backspace = "2"
opt.completeopt = {"menuone", "noinsert", "noselect"}
opt.cursorline = true
opt.display = "lastline"
opt.expandtab = true
opt.ignorecase = true
opt.linespace = 5
opt.list = true
opt.mouse = "a"
opt.number = true
opt.number = true
opt.pumheight = 20
opt.report = 0
opt.scrolloff = 4
opt.shiftround = true
opt.shiftwidth = 2
opt.showmatch = true
opt.showmode = true
opt.sidescrolloff = 8
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 2
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = 500
opt.wildmode = {"list", "longest"}
opt.wrap = false

