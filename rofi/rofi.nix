{pkgs, ...}:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "~/.config/rofi/catppuccin-mocha.rasi";
    extraConfig = {
      modi = "run,drun,window";
      font = "DejaVuSansMono Nerd Font 12";
      show-icons = true;
      terminal = "alacritty";
      drun-display-format = "{icon} {name}";
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-run = "   Run ";
      sidebar-mode = true;
    };
  };

  xdg.configFile."rofi/catppuccin-mocha.rasi".source = ./catppuccin-mocha.rasi;
}
