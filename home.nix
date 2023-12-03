{ config, pkgs, wdisplays-src, ... }:

let
 
  wdisplays_overlay = (self: super: {
    src = wdisplays-src;
  });

in

{

  nixpkgs.overlays = [ wdisplays_overlay ];

  imports = [
    ./alacritty/alacritty.nix
    ./firefox/firefox.nix
    ./nvim/nvim.nix
    ./rofi/rofi.nix
    ./starship.nix
    ./sway/sway.nix
    ./sway/waybar.nix
    ./zsh.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "enziokam";
  home.homeDirectory = "/home/enziokam";

  fonts.fontconfig.enable = true;

  # Packages that should be intalled to the user profile
  home.packages = with pkgs; [
    bashmount
    bat
    bc
    blueman
    bottom
    brave
    clang-tools
    fd
    fzf
    gcc
    gdb
    glib
    gnome.file-roller
    gnumake
    imv
    julia-bin
    libreoffice-fresh
    networkmanagerapplet
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    pavucontrol
    pfetch
    polkit_gnome
    powertop
    python311
    qpdfview
    ripgrep
    rofi-power-menu
    sioyek
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
    WOBSOCK = "$XDG_RUNTIME_DIR/wob.sock";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.eza = {
    enable = true;
    enableAliases = true;
  };

  programs.git = {
    enable = true;
    userName = "EnzioKam";
    userEmail = "enziokamhh@gmail.com";
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

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  services.kanshi = {
    enable = true;
  };

  services.mako = {
    enable = true;
    backgroundColor = "#1e1e2e";
    textColor = "#cdd6f4";
    borderColor = "#89b4fa";
    progressColor = "over #313244";
    font = "JetBrainsMono Nerd Font 10";
    extraConfig = ''
      [urgency=high]
      border-color=#fab387
    '';
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Mauve-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["mauve"];
        size = "compact";
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Papirus-Dark-Maia";
      package = pkgs.papirus-maia-icon-theme;
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Mauve";
      package = pkgs.catppuccin-cursors.mochaMauve;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-icon-theme-name = "Papirus-Dark-Maia";
      gtk-cursor-theme-name = "Catppuccin-Mocha-Mauve";
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-theme = "Catppuccin-Mocha-Mauve";
    };
  };

  xdg.systemDirs.data = [
    "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
    "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
  ];

}
