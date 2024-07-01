{ config, pkgs, wdisplays-src, ... }:

{
  imports = [
    ./programs/cli.nix
    ./programs/nvim/nixvim.nix
    ./programs/nvim/plugins.nix
    ./programs/nvim/keymaps.nix
  ];

  home.username = "enziokam";
  home.homeDirectory = "/home/enziokam";

  home.stateVersion = "23.11";

  home.packages = with pkgs; [ ripgrep ];

  programs.home-manager.enable = true;

  catppuccin.accent = "mauve";
  catppuccin.flavor = "mocha";
}
