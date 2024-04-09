{
  programs.nixvim.keymaps = [
    # Plugin related keybindings
    { mode = "n"; key = "<c-n>"; action = "<cmd>NvimTreeToggle<cr>"; }
    { mode = "n"; key = "<leader>wi"; action = "<Plug>VimwikiIndex"; }

    # Navigate windows
    { mode = "n"; key = "<c-h>"; action = "<c-w>h"; }
    { mode = "n"; key = "<c-j>"; action = "<c-w>j"; }
    { mode = "n"; key = "<c-k>"; action = "<c-w>k"; }
    { mode = "n"; key = "<c-l>"; action = "<c-w>l"; }

    # Tab keybindings
    { mode = "n"; key = "<leader>t"; action = "<cmd>tabnew<cr>"; }

    # Original remappings from vim-better-default at
    # https://github.com/liuchengxu/vim-better-default
    { mode = "n"; key = "<leader>q"; action = "<cmd>q<cr>"; }
    { mode = "n"; key = "<leader>Q"; action = "<cmd>qa!<cr>"; }
    { mode = "n"; key = "<leader>d"; action = "<c-d>"; }
    { mode = "n"; key = "<leader>u"; action = "<c-u>"; }
    { mode = ["n" "i"]; key = "<c-a>"; action = "<home>"; }
    { mode = ["n" "i"]; key = "<c-e>"; action = "<end>"; }
    { mode = ["n" "i"]; key = "<c-d>"; action = "<delete>"; }
    { mode = "i"; key = "jj"; action = "<esc>"; }
    { mode = "c"; key = "jj"; action = "<c-c>"; }
    { mode = "v"; key = "v"; action = "<esc>"; }
    { mode = "n"; key = "H"; action = "^"; }
    { mode = "n"; key = "L"; action = "$"; }
    { mode = "n"; key = "U"; action = "<c-r>"; }
    { mode = "n"; key = "Y"; action = "y$"; }

    # Buffers
    { mode = "n"; key = "<leader>bp"; action = "<cmd>bprevious<cr>"; }
    { mode = "n"; key = "<leader>bn"; action = "<cmd>bnext<cr>"; }
    { mode = "n"; key = "<leader>bf"; action = "<cmd>bfirst<cr>"; }
    { mode = "n"; key = "<leader>bl"; action = "<cmd>blast<cr>"; }
    { mode = "n"; key = "<leader>bd"; action = "<cmd>bd<cr>"; }
    { mode = "n"; key = "<leader>bk"; action = "<cmd>bw<cr>"; }

    # Moving and navigating windows
    { mode = "n"; key = "<leader>ww"; action = "<c-W>w"; }
    { mode = "n"; key = "<leader>wr"; action = "<c-W>r"; }
    { mode = "n"; key = "<leader>wd"; action = "<c-W>c"; }
    { mode = "n"; key = "<leader>wn"; action = "<cmd>vnew<cr>"; }
    { mode = "n"; key = "<leader>wm"; action = "<cmd>new<cr>"; }
    { mode = "n"; key = "<leader>wq"; action = "<c-W>q"; }
    { mode = ["n" "t"]; key = "<leader>wh"; action = "<c-W>h"; }
    { mode = ["n" "t"]; key = "<leader>wj"; action = "<c-W>j"; }
    { mode = ["n" "t"]; key = "<leader>wk"; action = "<c-W>k"; }
    { mode = ["n" "t"]; key = "<leader>wl"; action = "<c-W>l"; }

    # Window sizing
    { mode = "n"; key = "<leader>wH"; action = "<c-W>5<"; }
    { mode = "n"; key = "<leader>wL"; action = "<c-W>5>"; }
    { mode = "n"; key = "<leader>wJ"; action = "<cmd>resize +5<cr>"; }
    { mode = "n"; key = "<leader>wK"; action = "<cmd>resize -5<cr>"; }
    { mode = "n"; key = "<leader>w="; action = "<c-W>="; }

    # Duplicating windows
    { mode = "n"; key = "<leader>ws"; action = "<c-W>s"; }
    { mode = "n"; key = "<leader>w-"; action = "<c-W>s"; }
    { mode = "n"; key = "<leader>wv"; action = "<c-W>v"; }
    { mode = "n"; key = "<leader>w2"; action = "<c-W>v"; }

    # Terminal keybindings
    { mode = "n"; key = "<m-t>"; action = "<cmd>te<cr>"; }
    { mode = "n"; key = "<m-0>"; action = "<cmd>b term<cr>"; }
    { mode = "t"; key = "<c-]>"; action = "<c-\\><c-n>"; }
    { mode = "t"; key = "<c-j><c-k>"; action = "<c-\\><c-N>"; }
    { mode = "t"; key = "<c-h>"; action = "<c-\\><c-N><c-w>h"; }
    { mode = "t"; key = "<c-j>"; action = "<c-\\><c-N><c-w>j"; }
    { mode = "t"; key = "<c-k>"; action = "<c-\\><c-N><c-w>k"; }
    { mode = "t"; key = "<c-l>"; action = "<c-\\><c-N><c-w>l"; }
  ];
}

