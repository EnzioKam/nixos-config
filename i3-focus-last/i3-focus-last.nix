{pkgs, ...}:

{
  xdg.configFile."i3-focus-last/icons.json".text = ''
    {
      "Alacritty": "terminal",
      "firefox": "firefox",
      "pavucontrol": "pavucontrol",
      "nm-connection-editor": "nm-device-wireless",
      "thunar": "Thunar",
      "imv": "image-viewer",
      "mpv": "mpv",
      "sioyek": "qpdfview"
    }
  '';
}
