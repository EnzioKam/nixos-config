{
  programs.nixvim.extraConfigLua = ''
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
  '';
}
