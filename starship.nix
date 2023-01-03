{pkgs, lib, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      scan_timeout = 10;
      format = lib.concatStrings [
        "[┌](bold purple) $directory"
        "$git_status$git_branch"
        "$line_break"
        "$java$python$conda$julia"
        "[└ $character](bold purple)"
      ];
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };
      package = {
        disabled = true;
        symbol = " ";
      };
      time = {
        disabled = false;
        format = "[\[ $time \]]($style) ";
        utc_time_offset = "+8";
      };
      directory = {
        read_only = " ";
      };
      git_branch = {
        symbol = " ";
      };
      java = {
        symbol = " ";
      };
      julia = {
        symbol = " ";
      };
      memory_usage = {
        symbol = " ";
      };
      python = {
        symbol = " ";
      };
    };
  };
}
