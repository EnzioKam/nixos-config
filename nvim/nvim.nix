{pkgs, config, ...}:

{
  xdg.configFile."nvim/init.lua" = {
    source = config.lib.file.mkOutOfStoreSymlink /home/enziokam/.config/home-manager/nvim/init.lua ;
  };
  xdg.configFile."nvim/lua" = {
    source = config.lib.file.mkOutOfStoreSymlink /home/enziokam/.config/home-manager/nvim/lua ;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    coc = {
      enable = true;
      settings = {
        "suggest.noselect" = true;
      };
    };

    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      comment-nvim
      fzf-lua
      gitsigns-nvim
      indent-blankline-nvim
      julia-vim
      lualine-nvim
      nvim-autopairs
      nvim-colorizer-lua
      nvim-scrollview
      nvim-tree-lua
      nvim-treesitter.withAllGrammars
      nvim-web-devicons
      plenary-nvim
      rainbow-delimiters-nvim
      toggleterm-nvim
      vim-nix
      vimwiki
    ];
  };
}
