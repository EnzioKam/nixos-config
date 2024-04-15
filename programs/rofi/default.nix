{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "~/.config/rofi/catppuccin-mocha.rasi";
    extraConfig = {
      modi = "run,drun,window";
      font = "DejaVuSansMono Nerd Font 12";
      show-icons = true;
      terminal = "footclient";
      drun-display-format = "{icon} {name}";
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = " 󱂬  Window ";
      sidebar-mode = true;
    };
  };

  home.packages = with pkgs; [ rofi-power-menu ];

  xdg.configFile."rofi/catppuccin-mocha.rasi".source = ./catppuccin-mocha.rasi;
}
