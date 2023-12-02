{pkgs, ...}:

{
  home.packages = with pkgs; [
    autotiling
    brightnessctl
    libnotify
    pulseaudio
    shotman
    swaybg
    wdisplays
    wl-clipboard
    wl-mirror
    wob
  ];

  programs.swaylock = {
    enable = true;
    settings = {
      image = "~/.config/home-manager/wallpaper.png";
    };
  };
}

