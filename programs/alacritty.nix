{

  catppuccin.alacritty.enable = true;

  programs.alacritty = {
    enable = true;
    settings = {
      # env.TERM = "alacritty";
      keyboard.bindings = [{
        key = "Return";
        mods = "Control|Shift";
        action = "SpawnNewInstance";
      }];
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
        opacity = 0.8;
      };
      font = {
        normal = { family = "JuliaMono"; };
        bold = { family = "JuliaMono"; };
        italic = { family = "JuliaMono"; };
        size = 14.0;
        offset = {
          x = 0;
          y = 1;
        };
      };
    };
  };
}

