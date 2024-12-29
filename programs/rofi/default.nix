{ pkgs, ... }:

{
  catppuccin.rofi.enable = true;

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    theme = {
      "*" = {
        border-col = "#cdd6f4";
        width = 900;
        font = "DejaVuSansMono Nerd Font 12";
      };
      "window" = { height = 580; };
      "listview" = {
        columns = 3;
        lines = 12;
      };
    };

    extraConfig = {
      modi = "run,drun,window";
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
}
