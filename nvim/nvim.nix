{pkgs, config, ...}:

{
  xdg.configFile."nvim/lua/settings.lua".source = ./lua/settings.lua ;
  xdg.configFile."nvim/lua/coc.lua".source = ./lua/coc.lua ;
  xdg.configFile."nvim/lua/bindings.lua".source = ./lua/bindings.lua ;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraConfig = ''
      luafile $HOME/.config/nvim/lua/settings.lua
      luafile $HOME/.config/nvim/lua/coc.lua
      luafile $HOME/.config/nvim/lua/bindings.lua
    '';

    coc = {
      enable = true;
      settings = {
        "suggest.noselect" = true;
      };
    };

    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      comment-nvim
      FTerm-nvim
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
      vim-nix
    ];
  };
}
