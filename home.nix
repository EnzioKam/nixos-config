{ config, pkgs, wdisplays-src, ... }:

let

  wdisplays_overlay = (self: super: {
    wdisplays = super.wdisplays.overrideAttrs (old: { src = wdisplays-src; });
  });

in {

  nixpkgs.overlays = [ wdisplays_overlay ];

  imports = [ ./programs ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "enziokam";
  home.homeDirectory = "/home/enziokam";

  fonts.fontconfig.enable = true;

  # Packages that should be installed to the user profile
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
    file-roller
    gnumake
    julia
    julia-mono
    libreoffice-fresh
    nerd-fonts.dejavu-sans-mono
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    networkmanagerapplet
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    openfortivpn
    openfortivpn-webview
    pavucontrol
    pfetch-rs
    polkit_gnome
    powertop
    python311
    qpdfview
    ripgrep
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
    EDITOR = "nvim";
    VISUAL = "nvim";
    PF_INFO = "ascii title os host kernel uptime pkgs memory wm shell palette";
    WOBSOCK = "$XDG_RUNTIME_DIR/wob.sock";
    XDG_CURRENT_DESKTOP = "sway";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  catppuccin = {
    accent = "mauve";
    flavor = "mocha";
    cursors.enable = true;
    gtk.icon.enable = true;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Colloid-Purple-Dark-Catppuccin";
      package = pkgs.colloid-gtk-theme.override {
        tweaks = [ "catppuccin" "black" ];
        themeVariants = [ "purple" ];
      };
    };

    gtk3.extraConfig = { gtk-application-prefer-dark-theme = true; };
    gtk4.extraConfig = { gtk-application-prefer-dark-theme = true; };
  };

  xdg = {
    enable = true;
    configFile."xfce4/helpers.rc".text = "TerminalEmulator=footclient";
    systemDirs.data = [
      "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
      "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
    ];
  };

}
