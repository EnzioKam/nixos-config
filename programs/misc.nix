{ pkgs, ... }:

{
  programs.bat = {
    enable = true;
    catppuccin.enable = true;
  };

  programs.bottom = {
    enable = true;
    catppuccin.enable = true;
  };

  programs.eza.enable = true;

  programs.fzf = {
    enable = true;
    catppuccin.enable = true;
    defaultCommand = "fd -H";
  };

  programs.git = {
    enable = true;
    userName = "EnzioKam";
    userEmail = "enziokamhh@gmail.com";
  };

  programs.imv = {
    enable = true;
    catppuccin.enable = true;
  };

  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };

  programs.mpv = {
    enable = true;
    config = {
      profile = "gpu-hq";
      ao = "pipewire";
      vo = "dmabuf-wayland";
      hwdec = "vaapi";
      gpu-context = "wayland";
    };
  };

  programs.sioyek = {
    enable = true;
    config = {
      "page_separator_width" = "2";
    };
  };
}
