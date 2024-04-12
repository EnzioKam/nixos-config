{ pkgs, ... }:

{
  programs.bat = {
    enable = true;
    catppuccin.enable = true;
  };

  programs.bottom = {
    enable = true;
    catppuccin.enable = true;
  };

  programs.eza.enable = true;

  programs.fzf = {
    enable = true;
    catppuccin.enable = true;
    defaultCommand = "fd -H";
  };

  programs.git = {
    enable = true;
    userName = "EnzioKam";
    userEmail = "enziokamhh@gmail.com";
  };

  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };
}
