{pkgs, lib, ... }:

{
  programs.starship =
    let
      flavour = "mocha";
    in {
      enable = true;
      settings = {
        add_newline = true;
        scan_timeout = 10;
        palette = "catppuccin_${flavour}";
        format = lib.concatStrings [
          "[┌](bold purple) $directory"
          "$git_status$git_branch"
          "$line_break"
          "[└ $character](bold purple)"
          "$c$java$python$julia$lua"
        ];
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[✗](bold red)";
        };
        package = {
          symbol = "󰏗 ";
        };
        time = {
          disabled = false;
          format = "[\[ $time \]]($style) ";
          utc_time_offset = "+8";
        };
        directory = {
          read_only = " 󰌾";
        };
        git_branch = {
          symbol = " ";
        };
        c = {
          symbol = " ";
        };
        java = {
          symbol = " ";
        };
        python = {
          symbol = " ";
        };
        julia = {
          symbol = " ";
        };
        lua = {
          symbol = " ";
        };
        memory_usage = {
          symbol = "󰍛 ";
        };
      } // builtins.fromTOML (builtins.readFile
    (pkgs.fetchFromGitHub
    {
      owner = "catppuccin";
      repo = "starship";
      rev = "5629d2356f62a9f2f8efad3ff37476c19969bd4f";
      sha256 = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
    } + /palettes/${flavour}.toml));
  };
}
