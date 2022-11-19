{pkgs, ...}:

{
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "alacritty";
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
      };
      font = {
        normal = {
          family = "FiraCode Nerd Font";
	  style = "Regular";
	};
	bold = {
          family = "FiraCode Nerd Font";
	  style = "Bold";
	};
	italic = {
          family = "FiraCode Nerd Font";
	  style = "Italic";
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

