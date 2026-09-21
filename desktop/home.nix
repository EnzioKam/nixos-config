{
  config,
  pkgs,
  ...
}:

{

  imports = [
    ../programs/common
    ../programs/desktop
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "enziokam";
  home.homeDirectory = "/home/enziokam";
  home.pointerCursor.enable = true;

  fonts.fontconfig.enable = true;

  # Packages that should be installed to the user profile
  home.packages = with pkgs; [
    bashmount
    bc
    brave
    clang-tools
    fd
    gcc
    gdb
    glib
    gnumake
    julia-mono
    libreoffice
    nerd-fonts.dejavu-sans-mono
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    neovim
    pfetch-rs
    powertop
    python311
    ripgrep
    sysfsutils
    texliveFull
    unzip
    usbutils
    xdg-utils
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
    XDG_CURRENT_DESKTOP = "KDE";
  };

  nix = {
    package = pkgs.nix;
    extraOptions = ''
      experimental-features = nix-command flakes 
    '';
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  catppuccin = {
    enable = true;
    autoEnable = false;
    cache.enable = true;
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
        tweaks = [
          "catppuccin"
          "black"
        ];
        themeVariants = [ "purple" ];
      };
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  xdg = {
    enable = true;
    systemDirs.data = [
      "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
      "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
    ];
  };

}
