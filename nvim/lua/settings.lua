local cmd = vim.cmd  -- to execute Vim commands e.g. cmd("pwd")
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.latex_to_unicode_auto = 1
g.coc_global_extensions = {
  'coc-java',
  'coc-json',
  'coc-julia',
  'coc-markdown-preview-enhanced',
  'coc-markdownlint',
  'coc-pyright',
  'coc-snippets',
  'coc-toml',
  'coc-webview'
}
g.vimwiki_list = {{
  path = '~/vimwiki/',
  syntax = 'markdown',
  ext = '.md'
}}
g.vimwiki_global_ext = 0

require("catppuccin").setup({
  integrations = {
    coc_nvim = true,
    gitsigns = true,
    markdown = true,
    nvimtree = true,
    treesitter = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false
    }
  }
})
require("gitsigns").setup()
require("indent_blankline").setup {
  show_current_context = true,
  show_current_context_start = true,
  -- space_char_blankline = " ",
  -- char_highlight_list = {
  --   "IndentBlanklineIndent1",
  --   "IndentBlanklineIndent2",
  --   "IndentBlanklineIndent3",
  --   "IndentBlanklineIndent4",
  --   "IndentBlanklineIndent5",
  --   "IndentBlanklineIndent6"
  -- }
}
require("nvim-treesitter.configs").setup({
  highlight = {enable = true}
})
require("Comment").setup({
  toggler = {
    line = ';;'
  },
  opleader = {
    line = ';'
  }
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
require('colorizer').setup()

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

