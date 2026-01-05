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
    settings.user = {
      name = "EnzioKam";
      email = "enziokamhh@gmail.com";
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };

  programs.java = {
    enable = true;
    package = pkgs.jdk21;
  };
}
