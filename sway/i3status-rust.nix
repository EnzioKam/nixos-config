{pkgs, ...}:

{
  xdg.configFile."i3status-rust/theme.toml".source = ./theme.toml; 

  programs.i3status-rust = {
    enable = true;
    bars = {
      top = {
        blocks = [
	  { block = "disk_space"; interval = 60; format = "{icon} {available}"; }
	  { block = "memory"; format_mem = "{mem_used_percents}"; format_swap = "{swap_used_percents}"; }
	  { block = "cpu"; }
	  { block = "sound"; } 
	  { block = "backlight"; }
	  { block = "networkmanager"; on_click = "alacritty -e nmtui"; ap_format = "{ssid^10}"; device_format = "{icon}{ap}"; }
	  { block = "battery"; format = "{percentage:6#100} {percentage} {time}"; }
	  { block = "temperature"; collapsed = false; format = "{max}"; chip = "*-isa-*"; interval = 10; }
	  { block = "time"; format = "%a %d/%m %R"; interval = 60; }
	];
	icons = "material-nf";
	theme = "/home/enziokam/.config/i3status-rust/theme.toml";
      };
    };
  };
}

