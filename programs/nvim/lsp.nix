{ config, pkgs, ... }: {
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      settings = {
        snippet.expand =
          "function(args) require('luasnip').lsp_expand(args.body) end";
        mapping = {
          "<tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<s-tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<cr>" = "cmp.mapping.confirm({ select = true })";
        };
        sources = [
          { name = "path"; }
          { name = "nvim_lsp"; }
          { name = "nvim_lsp_signature_help"; }
          { name = "nvim_lua"; }
          { name = "luasnip"; }
          {
            name = "buffer";
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }
        ];
        experimental.ghost_text = true;
      };
    };

    friendly-snippets.enable = true;

    luasnip = {
      enable = true;
      fromVscode = [ { } ];
    };

    nvim-jdtls = let home = "${config.home.homeDirectory}";
    in {
      enable = true;
      configuration = "${home}/.cache/jdtls/config";
      data = "${home}/.cache/jdtls/workspace";
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

    conform-nvim = {
      enable = true;
      formattersByFt = {
        "*" = [ "codespell" ];
        "_" = [ "trim_whitespace" ];
        lua = [ "stylua" ];
        nix = [ "nixfmt" ];
        python = [ "isort" "black" ];
        markdown = [ "mdformat" ];
      };
      formatOnSave = ''
        function(bufnr)
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end
            return { timeout_ms = 500, lsp_fallback = true }
          end
      '';
    };
  };

  home.packages = with pkgs; [
    alejandra
    black
    codespell
    isort
    mdformat
    nixfmt
    stylua
  ];
}
