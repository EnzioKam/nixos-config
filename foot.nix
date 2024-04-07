{pkgs, ...}:

{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        font = "JuliaMono:size=14,FiraCode Nerd Font:size=14";
        pad = "15x15";
      };
      cursor = {
        color = "1e1e2e f5e0dc";
      };
      colors = {
        alpha = 0.8;
        foreground = "cdd6f4";
        background = "1e1e2e";
        regular0 = "45475a";
        regular1 = "f38ba8";
        regular2 = "a6e3a1";
        regular3 = "f9e2af";
        regular4 = "89b4fa";
        regular5 = "f5c2e7";
        regular6 = "94e2d5";
        regular7 = "bac2de";
        bright0 = "585b70";
        bright1 = "f38ba8";
        bright2 = "a6e3a1";
        bright3 = "f9e2af";
        bright4 = "89b4fa";
        bright5 = "f5c2e7";
        bright6 = "94e2d5";
        bright7 = "a6adc8";
        dim0 = "45475a";
        dim1 = "f38ba8";
        dim2 = "a6e3a1";
        dim3 = "f9e2af";
        dim4 = "89b4fa";
        dim5 = "f5c2e7";
        dim6 = "94e2d5";
        dim7 = "bac2de";
      };
      key-bindings = {
        spawn-terminal = "Control+Shift+Return";
      };
    };
  };
}

