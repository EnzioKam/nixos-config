{
  programs.nixvim.plugins = {
    luasnip.enable = true;

    lsp = {
      keymaps = {
        diagnostic = {
          "<leader>j" = "goto_next";
          "<leader>k" = "goto_prev";
        };
        lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
      };

      servers = {
        java-language-server.enable = true;
        julials.enable = true;
        lua-ls.enable = true;
        marksman.enable = true;
        nixd.enable = true;
        pyright.enable = true;
        taplo.enable = true;
      };
    };
  };
}
