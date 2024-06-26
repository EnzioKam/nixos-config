{
  programs.imv = {
    enable = true;
    catppuccin.enable = true;
  };

  programs.mpv = {
    enable = true;
    catppuccin.enable = true;
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
    config = { "page_separator_width" = "2"; };
  };
}
