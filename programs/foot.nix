{
  catppuccin.foot.enable = true;

  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        font = "JuliaMono:size=14,FiraCode Nerd Font:size=14";
        pad = "15x15";
      };
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
        cursor = "1e1e2e f5e0dc";
      };
      key-bindings = {
        spawn-terminal = "Control+Shift+Return";
      };
    };
  };
}
