{ pkgs, ... }:

{
  programs.nixvim = {
    colorschemes.catppuccin = {
      enable = true;
      flavour = "mocha";
      transparentBackground = true;
      integrations = {
        vimwiki = true;
        indent_blankline = {
          scope_color = "lavender";
        };
      };
    };

    plugins = {
      comment.enable = true;
      fzf-lua.enable = true;
      gitsigns.enable = true;
      indent-blankline.enable = true;
      lualine.enable = true;
      nvim-autopairs.enable = true;
      nvim-colorizer.enable = true;
      nvim-tree.enable = true;
      rainbow-delimiters.enable = true;
      toggleterm.enable = true;
      treesitter.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      julia-vim
      nvim-scrollview
      vim-nix
      vimwiki
    ];

    globals = {
      latex_to_unicode_auto = 1;
      vimwiki_list = [
        { path = "~/vimwiki/"; syntax = "markdown"; ext = ".md"; }
      ];
      vimwiki_global_ext = 0;
    };
  };
}
