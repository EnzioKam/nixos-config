{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha_transparent";
      editor = { color-modes = true; };
      editor.soft-wrap = { enable = true; };
      editor.indent-guides = { render = true; };
      editor.lsp = { display-messages = true; };
      editor.statusline = {
        left = [ "mode" "spinner" "file-name" "file-modification-indicator" ];
        right = [
          "version-control"
          "diagnostics"
          "selections"
          "position"
          "file-encoding"
          "file-line-ending"
          "file-type"
        ];
        mode.normal = "NORMAL";
        mode.insert = "INSERT";
        mode.select = "SELECT";
      };
    };
    languages.language = [{
      name = "nix";
      auto-format = true;
      formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
    }];
    themes = {
      catppuccin_mocha_transparent = {
        "inherits" = "catppuccin_mocha";
        "ui.background" = { };
      };
    };
  };
}
