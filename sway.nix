{pkgs, ...}:

{
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
	  { block = "time"; format = "%a %d/%m %R"; interval = 60; }
	];
	icons = "material-nf";
      };
    };
  };

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = rec {
      modifier = "Mod4";
      terminal = "alacritty";
      menu = "wofi --show run";
      fonts = {
        names = ["JetBrainsMono Nerd Font"];
	size = 12.0;
      };
      gaps = {
        inner = 20;
      };
      bars = [{
        statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
      	command = "${pkgs.sway}/bin/swaybar";
	position = "top";
	fonts = {
	  names = ["JetBrainsMono Nerd Font"];
	  size = 12.0;
	};
	trayOutput = "*";
      }];
      startup = [
        { command = "exec dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP XDG_SESSION_TYPE"; }
	{ command = "exec systemctl --user import-environment"; }
	{ command = "exec systemctl --user start sway-session.target";}
	{ command = "exec autotiling";}
	{ command = "exec sleep 5; systemctl --user start kanshi.service";}
      ];
      assigns = {
	"2" = [ { app_id = "firefox"; } ];
      };
      keybindings = pkgs.lib.mkOptionDefault {
        "${modifier}+q" = "kill";
        "${modifier}+Shift+q" = "exec swaynag -t warning -m 'Exit sway?' -b 'Yes' 'swaymsg exit'";
	"${modifier}+b" = "exec firefox";
	"${modifier}+Shift+r" = "reload";
	"${modifier}+space" = "floating toggle";
	"${modifier}+p" = "move workspace to output right";
	"${modifier}+o" = "move workspace to output left";
	"Mod1+Control+Right" = "workspace next";
	"Mod1+Control+Left" = "workspace prev";
	"XF86AudioRaiseVolume" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +5%";
	"XF86AudioLowerVolume" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -5%";
	"XF86AudioMute" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
	"XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl s +5%";
        "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl s 5%-";
      };
    };
  };
}

