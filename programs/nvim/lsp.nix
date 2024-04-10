{
  programs.nixvim.extraConfigLua = ''
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
  '';

  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      settings = {
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        mapping = {
          "<tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<s-tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<cr>" = "cmp.mapping.confirm({ select = true })";
        };
        sources = [
          { name = "path"; }
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          {
            name = "buffer";
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }
        ];
      };
    };

    friendly-snippets.enable = true;

    luasnip = {
      enable = true;
      fromVscode = [ { } ];
    };

    nvim-jdtls = {
      enable = true;
      configuration = "/home/enziokam/.cache/jdtls/config";
      data = "/home/enziokam/.cache/jdtls/workspace";
      settings = {
        java = {
          signatureHelp = {
            enabled = true;
            description.enabled = true;
          };
          completion.guessMethodArguments = true;
        };
      };
    };

    lsp = {
      enable = true;
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
        julials.enable = true;
        lua-ls = {
          enable = true;
          extraOptions.settings.Lua.completion.callSnippet = "Replace";
        };
        marksman.enable = true;
        nixd.enable = true;
        pyright.enable = true;
        taplo.enable = true;
      };
    };
  };
}
