{pkgs, ...}:

{
  home.packages = with pkgs; [
    shotman
    swaybg
    wdisplays
    wl-clipboard
    wl-mirror
    wob
    workstyle
  ];

  xdg.configFile."i3status-rust/theme.toml".source = ./i3status-rust.toml; 
  xdg.configFile."workstyle/config.toml".source = ./workstyle.toml;

  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        blocks = [
          { block = "disk_space"; interval = 60; format = " $icon $available" ; }
          { block = "memory"; format = " $icon $mem_used_percents "; format_alt = " $icon_swap $swap_used_percents "; }
          { block = "cpu"; }
          { block = "sound"; } 
          { block = "backlight"; }
          {
            block = "net";
            format = " $icon $ssid ";
            click = [
              {button = "left"; cmd = "nm-connection-editor";}
            ];
          }
          { block = "temperature"; format = " $icon $max "; chip = "*-isa-*"; interval = 10; }
          { block = "battery"; format = " $icon $percentage $time "; }
          { block = "time"; interval = 60; }
        ];
        icons = "material-nf";
        theme = "/home/enziokam/.config/i3status-rust/theme.toml";
      };
    };
  };

  programs.swaylock = {
    enable = true;
    settings = {
      image = "../wallpaper.png";
    };
  };
}

