{ config, ... }:

{
  programs.zsh = {
    shellAliases =
      let
        home = "${config.home.homeDirectory}";
      in
      {
        hmu = "home-manager switch --flake '${home}/.config/home-manager/#enziokam@nixos-desktop'";
        nrs = "sudo nixos-rebuild switch --flake '${home}/.config/home-manager/#nixos-desktop'";
      };
  };
}
