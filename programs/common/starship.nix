{ lib, ... }:

{
  catppuccin.starship.enable = true;

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      scan_timeout = 10;
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
      package = { symbol = "󰏗 "; };
      time = {
        disabled = false;
        format = "[[ $time ]]($style) ";
        utc_time_offset = "+8";
      };
      directory = { read_only = " 󰌾"; };
      git_branch = { symbol = " "; };
      c = { symbol = " "; };
      java = { symbol = " "; };
      python = { symbol = " "; };
      julia = { symbol = " "; };
      lua = { symbol = " "; };
      memory_usage = { symbol = "󰍛 "; };
    };
  };
}
