{pkgs, config, ...}:

{
  xdg.configFile."nvim/lua/settings.lua".source = ./lua/settings.lua ;
  xdg.configFile."nvim/lua/bindings.lua".source = ./lua/bindings.lua ;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraConfig = ''
      luafile $HOME/.config/nvim/lua/settings.lua
      luafile $HOME/.config/nvim/lua/bindings.lua
    '';

    plugins = with pkgs.vimPlugins; [
      fzf-lua
      catppuccin-nvim
      lualine-nvim
      nvim-tree-lua
      nvim-web-devicons
      indent-blankline-nvim
      vim-nix
      gitsigns-nvim
      plenary-nvim
      nvim-scrollview
      nvim-comment
      nvim-autopairs
      nvim-colorizer-lua
      FTerm-nvim
    ];
  };
}
