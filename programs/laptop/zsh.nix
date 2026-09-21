{ config, ... }:

{
  programs.zsh = {
    loginExtra = ''
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec sway
      fi
    '';
    shellAliases =
      let
        home = "${config.home.homeDirectory}";
      in
      {
        hmu = "home-manager switch --flake '${home}/.config/home-manager/#enziokam@nixos'";
        nrs = "sudo nixos-rebuild switch --flake '${home}/.config/home-manager/#nixos-laptop'";
      };
  };
}
