{ config, pkgs, wdisplays-src, ... }:

let
 
  wdisplays_overlay = (self: super: {
    wdisplays = super.wdisplays.overrideAttrs(old: {
      src = wdisplays-src;
    });
  });

in

{

  nixpkgs.overlays = [
    wdisplays_overlay
  ];

  imports = [
    ./programs
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "enziokam";
  home.homeDirectory = "/home/enziokam";

  fonts.fontconfig.enable = true;

  # Packages that should be intalled to the user profile
  home.packages = with pkgs; [
    bashmount
    bc
    blueman
    brave
    clang-tools
    fd
    gcc
    gdb
    glib
    gnome.file-roller
    gnumake
    julia-bin
    julia-mono
    libreoffice-fresh
    networkmanagerapplet
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    openfortivpn
    pavucontrol
    pfetch
    polkit_gnome
    powertop
    python311
    qpdfview
    ripgrep
    rofi-power-menu
    sysfsutils
    texlive.combined.scheme-medium
    unzip
    usbutils
    xdg-utils
    xfce.exo
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    zip
    (nerdfonts.override { fonts = ["FiraCode" "JetBrainsMono" "DejaVuSansMono"]; })
  ];
  
  xdg.configFile."xfce4/helpers.rc".text = ''TerminalEmulator=footclient'';

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
    EDITOR = "nvim";
    VISUAL = "nvim";
    PF_INFO = "ascii title os host kernel uptime pkgs memory wm shell palette";
    WOBSOCK = "$XDG_RUNTIME_DIR/wob.sock";
    XDG_CURRENT_DESKTOP = "sway"; 
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  catppuccin.accent = "mauve";
  catppuccin.flavour = "mocha";

  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      size = "compact";
      cursor.enable = true;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "mauve";
      };
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-icon-theme-name = "Papirus-Dark";
      gtk-cursor-theme-name = "Catppuccin-Mocha-Mauve";
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-theme = "Catppuccin-Mocha-Mauve-Cursors";
    };
  };

  xdg.systemDirs.data = [
    "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
    "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
  ];

}
