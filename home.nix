{ config, pkgs, ... }:

{

  imports = [
    ./zsh.nix
    ./starship.nix
    ./alacritty/alacritty.nix
    ./sway/sway.nix
    ./sway/i3status-rust.nix
    ./firefox/firefox.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "enziokam";
  home.homeDirectory = "/home/enziokam";

  fonts.fontconfig.enable = true;

  # Packages that should be intalled to the user profile
  home.packages = with pkgs; [
    autotiling
    bat
    bottom
    brightnessctl
    fd
    fzf
    gnumake
    mako
    neofetch
    networkmanagerapplet
    pulseaudio
    ripgrep
    unzip
    wl-clipboard
    wl-mirror
    wofi
    zip
    swaybg
    (nerdfonts.override { fonts = ["FiraCode" "JetBrainsMono"]; })
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    XDG_CURRENT_DESKTOP = "sway"; 
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  programs.git = {
    enable = true;
    userName = "EnzioKam";
    userEmail = "enziokamhh@gmail.com";
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.catppuccin-gtk;
      name = "Catpuccin-Mocha-Lavender";
    };
    cursorTheme = {
      package = pkgs.catppuccin-cursors;
      name = "Catpuccin-Mocha-Lavender";
    };
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  services.kanshi = {
    enable = true;
  };

}
