{ pkgs, ... }:

{
  home.packages = with pkgs; [
    opencode-desktop
  ];

  programs.opencode = {
    enable = true;
  };
}
