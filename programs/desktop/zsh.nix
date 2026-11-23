{ config, lib, ... }:

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
    initContent = lib.mkAfter ''
      if [ -f "$HOME/.config/soclaas/soclaas.env" ]; then
        set -a
        . "$HOME/.config/soclaas/soclaas.env"
        set +a
      fi
    '';
  };
}
