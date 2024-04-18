{
  programs.foot = {
    enable = true;
    server.enable = true;
    catppuccin.enable = true;
    settings = {
      main = {
        font = "JuliaMono:size=14,FiraCode Nerd Font:size=14";
        pad = "15x15";
      };
      cursor = { color = "1e1e2e f5e0dc"; };
      colors = {
        alpha = 0.8;
        dim0 = "45475a";
        dim1 = "f38ba8";
        dim2 = "a6e3a1";
        dim3 = "f9e2af";
        dim4 = "89b4fa";
        dim5 = "f5c2e7";
        dim6 = "94e2d5";
        dim7 = "bac2de";
      };
      key-bindings = { spawn-terminal = "Control+Shift+Return"; };
    };
  };
}

