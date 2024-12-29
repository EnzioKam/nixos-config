{
  catppuccin = {
    imv.enable = true;
    mpv.enable = true;
  };

  programs.imv.enable = true;

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
    config = { "page_separator_width" = "2"; };
  };
}
