{ config, pkgs, ... }:

{

  imports = [
    ./zsh.nix
    ./starship.nix
    ./alacritty/alacritty.nix
    ./sway/sway.nix
    ./sway/i3status-rust.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "enziokam";
  home.homeDirectory = "/home/enziokam";

  fonts.fontconfig.enable = true;

  # Packages that should be intalled to the user profile
  home.packages = with pkgs; [
    bottom
    gnumake
    neofetch
    wl-clipboard
    mako
    wofi
    brightnessctl
    pulseaudio
    autotiling
    bat
    fzf
    fd
    ripgrep
    wl-mirror
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

  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      forceWayland = true;
    };
    profiles.default = {
      id = 0;
      name = "Default";
      settings = {
        # Disable all sorts of telemetry
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
	"browser.newtabpage.activity-stream.telemetry" = false;
	"browser.ping-centre.telemetry" = false;
	"toolkit.telemetry.archive.enabled" = false;
	"toolkit.telemetry.bhrPing.enabled" = false;
	"toolkit.telemetry.enabled" = false;
	"toolkit.telemetry.firstShutdownPing.enabled" = false;
	"toolkit.telemetry.hybridContent.enabled" = false;
	"toolkit.telemetry.newProfilePing.enabled" = false;
	"toolkit.telemetry.reportingpolicy.firstRun" = false;
	"toolkit.telemetry.shutdownPingSender.enabled" = false;
	"toolkit.telemetry.unified" = false;
	"toolkit.telemetry.updatePing.enabled" = false;

	# As well as Firefox 'experiments'
	"experiments.activeExperiment" = false;
	"experiments.enabled" = false;
	"experiments.supported" = false;
	"network.allow-experiments" = false;
      };
    };
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

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  services.kanshi = {
    enable = true;
  };

}
