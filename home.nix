{ config, pkgs, ... }:

{

  imports = [
    ./alacritty/alacritty.nix
    ./firefox/firefox.nix
    ./i3-focus-last/i3-focus-last.nix
    ./nvim/nvim.nix
    ./rofi/rofi.nix
    ./starship.nix
    ./sway/i3status-rust.nix
    ./sway/sway.nix
    ./zsh.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "enziokam";
  home.homeDirectory = "/home/enziokam";

  fonts.fontconfig.enable = true;

  # Packages that should be intalled to the user profile
  home.packages = with pkgs; [
    autotiling
    bashmount
    bat
    blueman
    bottom
    brightnessctl
    fd
    fzf
    glib
    gnome.file-roller
    gnumake
    imv
    julia-bin
    libreoffice-fresh
    networkmanagerapplet
    pavucontrol
    pfetch
    polkit_gnome
    pulseaudio
    python311
    qpdfview
    ripgrep
    rofi-power-menu
    sioyek
    sway-contrib.grimshot
    swaybg
    swaylock
    sysfsutils
    ungoogled-chromium
    unzip
    usbutils
    wdisplays
    wl-clipboard
    wl-mirror
    workstyle
    xdg-utils
    xfce.exo
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    zip
    (callPackage ./i3-focus-last/default.nix {})
    (nerdfonts.override { fonts = ["FiraCode" "JetBrainsMono" "DejaVuSansMono"]; })
  ];

  xdg.configFile."workstyle/config.toml".source = ./workstyle/config.toml;
  xdg.configFile."xfce4/helpers.rc".text = ''TerminalEmulator=alacritty'';

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

  services.kanshi = {
    enable = true;
  };

  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };

  programs.mpv = {
    enable = true;
    config = {
      profile = "gpu-hq";
      ao = "pipewire";
      vo = "dmabuf-wayland";
      hwdec = "vaapi";
      gpu-context = "wayland";
    };
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

}
