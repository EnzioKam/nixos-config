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
    defaultCommand = "fd -H";
    defaultOptions = [
      "--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8"
      "--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc"
      "--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
    ];
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
