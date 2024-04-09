{
  programs.nixvim.keymaps = [
    # Plugin related keybindings
    { mode = "n"; key = "<c-n>"; action = "<cmd>NvimTreeToggle<cr>"; }
    { mode = "n"; key = "<leader>wi"; action = "<Plug>VimwikiIndex"; }

    # fzf-lua
    {
      mode = "n";
      key = "<leader>b";
      options.silent = true;
      action = "<cmd>lua require('fzf-lua').buffers()<cr>";
    }
  ];
}
