{pkgs, ...}:

{
  xdg.configFile."alacritty/theme.toml".source = ./catppuccin-mocha.yml;

  programs.alacritty = {
    enable = true;
    settings = {
      # env.TERM = "alacritty";
      import = [ "~/.config/alacritty/theme.toml" ];
      key_bindings = [
        { key = "Return"; mods = "Control|Shift"; action = "SpawnNewInstance"; }
      ];
      window = {
        padding = {
          x = 15;
          y = 15;
        };
        dynamic_padding = false;
        decorations = "full";
        dynamic_title = true;
        class = {
          instance = "Alacritty";
          general = "Alacritty";
        };
        opacity = 0.9;
      };
      font = {
        normal = {
          family = "JuliaMono";
        };
        bold = {
          family = "JuliaMono";
        };
        italic = {
          family = "JuliaMono";
        };
        size = 14.0;
        offset = {
          x = 0;
          y = 1;
        };
      };
    };
  };
}

