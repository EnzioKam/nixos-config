{ config, pkgs, ... }:

{

  imports = [
    ./zsh.nix
    ./starship.nix
    ./alacritty/alacritty.nix
    ./sway/sway.nix
    ./sway/i3status-rust.nix
    ./firefox/firefox.nix
    ./rofi/rofi.nix
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
    glib
    gnumake
    imv
    neofetch
    networkmanagerapplet
    pavucontrol
    pulseaudio
    ripgrep
    rofi-power-menu
    sway-contrib.grimshot
    swaybg
    sysfsutils
    unzip
    wl-clipboard
    wl-mirror
    workstyle
    xdg-utils
    zip
    (nerdfonts.override { fonts = ["FiraCode" "JetBrainsMono" "DejaVuSansMono"]; })
  ];

  xdg.configFile."workstyle/config.toml".source = ./workstyle/config.toml;

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

  programs.mako = {
    enable = true;
    font = "JetBrainsMono Nerd Font 10";
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Purple-Dark";
      package = pkgs.catppuccin-gtk;
    };
    iconTheme = {
      name = "Papirus-Dark-Maia";
      package = pkgs.papirus-maia-icon-theme;
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Lavender";
      package = pkgs.catppuccin-cursors;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-icon-theme-name = "Papirus-Dark-Maia";
      gtk-cursor-theme-name = "Catppuccin-Mocha-Lavender";
    };
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-theme = "Catppuccin-Mocha-Lavender";
    };
  };
  xdg.systemDirs.data = [
    "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
    "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
  ];

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  services.kanshi = {
    enable = true;
  };

}
