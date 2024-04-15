{ pkgs, ... }:

{
  programs.nixvim = {
    colorschemes.catppuccin = {
      enable = true;
      flavour = "mocha";
      transparentBackground = true;
      integrations = {
        vimwiki = true;
        indent_blankline = { scope_color = "lavender"; };
      };
    };

    plugins = {
      comment = {
        enable = true;
        settings = {
          toggler.line = ";;";
          opleader.line = ";";
        };
      };
      fzf-lua = {
        enable = true;
        keymaps = {
          "<leader>b".action = "buffers";
          "<leader>h".action = "oldfiles";
          "<leader>f".action = "files";
          "<leader>l".action = "blines";
        };
      };
      gitsigns = {
        enable = true;
        # next_hunk, prev_hunk to be deprecated
        settings.on_attach = ''
          function(bufnr)
            local gitsigns = require('gitsigns')
            local function map(mode, l, r, opts)
              opts = opts or {}
              opts.buffer = bufnr
              vim.keymap.set(mode, l, r, opts)
            end

            map('n', ']c', function()
              if vim.wo.diff then
                vim.cmd.normal({']c', bang = true})
              else
              gitsigns.next_hunk()
              end
            end)

            map('n', '[c', function()
              if vim.wo.diff then
                vim.cmd.normal({'[c', bang = true})
              else
                gitsigns.prev_hunk()
              end
            end)

            map('n', '<leader>hp', gitsigns.preview_hunk)
          end
        '';
      };
      indent-blankline.enable = true;
      lualine.enable = true;
      nvim-autopairs.enable = true;
      nvim-colorizer.enable = true;
      nvim-tree.enable = true;
      rainbow-delimiters.enable = true;
      toggleterm = {
        enable = true;
        openMapping = "<c-t>";
      };
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
      vimwiki_list = [{
        path = "~/vimwiki/";
        syntax = "markdown";
        ext = ".md";
      }];
      vimwiki_global_ext = 0;
    };
  };
}
