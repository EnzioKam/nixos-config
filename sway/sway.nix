{pkgs, config, ...}:

{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = rec {
      modifier = "Mod4";
      terminal = "alacritty";
      floating.border = 4;
      window.border = 4;
      menu = "rofi -show drun";
      fonts = {
        names = ["JetBrainsMono Nerd Font"];
	size = 12.0;
      };
      gaps = {
        inner = 15;
      };
      colors = let
	fore = "#cdd6f4";
	back = "#1e1e2e";
	urge = "#f38ba8";
      in {
        background = fore;
	focused = {
          border = fore;
          background = fore;
          text = back;
          indicator = fore;
          childBorder = fore;
	};
	focusedInactive = {
          border = back;
          background = back;
          text = fore;
          indicator = back;
          childBorder = back;
	};
	unfocused = {
          border = back;
          background = back;
          text = fore;
          indicator = back;
          childBorder = back;
	};
	urgent = {
          border = urge;
          background = urge;
          text = fore;
          indicator = urge;
          childBorder = urge;
	};
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
	colors = let colorScheme = import ../catppuccin.nix; in {
	  background = "${colorScheme.background}";
          focusedWorkspace = { background = "${colorScheme.color9}"; border = "${colorScheme.color0}"; text = "${colorScheme.color0}"; };
          activeWorkspace = { background = "${colorScheme.foreground}"; border = "${colorScheme.color0}"; text = "${colorScheme.color0}"; };
          inactiveWorkspace = { background = "${colorScheme.color7}"; border = "${colorScheme.color0}"; text = "${colorScheme.color0}"; };
	};
      }];
      startup = [
	{ command = "systemctl --user import-environment"; }
	{ command = "autotiling"; }
	{ command = "sleep 5; systemctl --user start kanshi.service"; }
	{ command = "workstyle &> /tmp/workstyle.log"; }
      ];
      assigns = {
	"2" = [ { app_id = "firefox"; } ];
	"4" = [ { app_id = "qpdfview.local."; } ];
        "5" = [
	  { app_id = "pavucontrol"; }
          { app_id = "nm-connection-editor"; }
	];
      };
      keybindings = pkgs.lib.mkOptionDefault {
        "${modifier}+q" = "kill";
        "${modifier}+Shift+q" = 
	  "exec rofi -show power-menu -modi \"power-menu:rofi-power-menu --choices=shutdown/reboot/suspend/hibernate/logout\"";
	"${modifier}+b" = "exec firefox";
	"${modifier}+Shift+r" = "reload";
	"${modifier}+space" = "floating toggle";
	"${modifier}+p" = "move workspace to output right";
	"${modifier}+o" = "move workspace to output left";
	"Mod1+Tab" = "exec i3-focus-last menu";
	"Mod1+Control+Right" = "workspace next";
	"Mod1+Control+Left" = "workspace prev";
	"XF86AudioRaiseVolume" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +5%";
	"XF86AudioLowerVolume" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -5%";
	"XF86AudioMute" = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
	"XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl s +5%";
        "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl s 5%-";
      };
      input = {
        "1:1:AT_Translated_Set_2_keyboard" = {
          xkb_options = "ctrl:swapcaps";
	};
      };
      output = {
        "*" = {
          bg = "~/.config/nixpkgs/wallpaper.png fill";
	};
      };
    };
  };
}

