{ pkgs, ... }:

{
  programs.nixvim = {
    extraConfigLua = ''
      require('glow').setup()

      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local handlers = require('nvim-autopairs.completion.handlers')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done({
          filetypes = {
            ["*"]= {
              ["("] = {
                kind = {
                  cmp.lsp.CompletionItemKind.Function,
                  cmp.lsp.CompletionItemKind.Method,
                  cmp.lsp.CompletionItemKind.Constructor
                },
                handler = handlers["*"]
              }
            }
          }
        })
      )

      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = "Disable autoformat-on-save",
        bang = true,
      })

      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = "Re-enable autoformat-on-save",
      })
    '';

    extraPlugins = with pkgs.vimPlugins; [ glow-nvim ];
  };
}
