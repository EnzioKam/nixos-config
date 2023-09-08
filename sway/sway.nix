{pkgs, config, ...}:

{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraConfigEarly = ''
      exec rm -f $WOBSOCK && mkfifo $WOBSOCK && tail -f $WOBSOCK | wob
    '';
    config = rec {
      modifier = "Mod4";
      terminal = "alacritty";
      floating.border = 2;
      window.border = 2;
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
      keybindings = pkgs.lib.mkOptionDefault {
        "${modifier}+q" = "kill";
        "${modifier}+Shift+q" = 
        "exec rofi -show power-menu -modi \"power-menu:rofi-power-menu --choices=shutdown/reboot/suspend/hibernate/logout\"";
        "${modifier}+Shift+r" = "reload";
        "${modifier}+space" = "floating toggle";
        "${modifier}+p" = "move workspace to output right";
        "${modifier}+o" = "move workspace to output left";
        "${modifier}+l" = "exec swaylock";
        "${modifier}+s" = "exec shotman --capture region";
        "Mod1+Tab" = "exec rofi -show window";
        "Mod1+Control+Right" = "workspace next";
        "Mod1+Control+Left" = "workspace prev";
        "XF86AudioRaiseVolume" =  "exec pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | awk '{print substr($5, 1, length($5)-1)}' > $WOBSOCK";
        "XF86AudioLowerVolume" =  "exec pactl set-sink-volume @DEFAULT_SINK@ -5% && pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | awk '{print substr($5, 1, length($5)-1)}' > $WOBSOCK";
        "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86MonBrightnessUp" = "exec brightnessctl set +5% | sed -En 's/.*\(([0-9]+)%\).*/\1/p' > $WOBSOCK";
        "XF86MonBrightnessDown" = "exec brightnessctl set 5%- | sed -En 's/.*\(([0-9]+)%\).*/\1/p' > $WOBSOCK";
      };
      input = {
        "1:1:AT_Translated_Set_2_keyboard" = {
          xkb_options = "ctrl:swapcaps";
        };
      };
      output = {
        "*" = {
          bg = "~/.config/home-manager/wallpaper.png fill";
        };
      };
    };
  };
}

