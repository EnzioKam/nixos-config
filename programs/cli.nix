{ pkgs, ... }:

{
  catppuccin = {
    bat.enable = true;
    bottom.enable = true;
    fzf.enable = true;
    delta.enable = true;
  };

  programs.bat.enable = true;
  programs.bottom.enable = true;
  programs.eza.enable = true;

  programs.fzf = {
    enable = true;
    defaultCommand = "fd -H";
  };

  programs.git = {
    enable = true;
    userName = "EnzioKam";
    userEmail = "enziokamhh@gmail.com";
    delta.enable = true;
  };

  programs.java = {
    enable = true;
    package = pkgs.jdk21;
  };
}
