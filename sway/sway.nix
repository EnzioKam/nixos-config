{pkgs, config, ...}:

{

  imports = [
    ./waybar.nix
    ./swaylock.nix
  ];

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

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    extraConfigEarly = ''
      exec rm -f $WOBSOCK && mkfifo $WOBSOCK && tail -f $WOBSOCK | wob
    '';
    extraConfig = ''
      blur enable
      blur_xray disable
      blur_passes 1
      blur_radius 2
      corner_radius 10
      default_dim_inactive 0
    '';
    config = rec {
      modifier = "Mod4";
      terminal = "footclient";
      floating.border = 0;
      window.border = 0;
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
        command = "${pkgs.waybar}/bin/waybar";
        position = "top";
      }];
      startup = [
        { command = "systemctl --user import-environment"; }
        { command = "autotiling"; }
        { command = "sleep 5; systemctl --user start kanshi.service"; }
      ];
      keybindings = 
        let  
          vol-out = "pactl get-sink-volume @DEFAULT_SINK@ | head -n 1 | awk '{print substr($5, 1, length($5)-1)}' > $WOBSOCK";
          bright-out = "sed -En 's/.*\\(([0-9]+)%\\).*/\\1/p' > $WOBSOCK";
        in
          pkgs.lib.mkOptionDefault {
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
            "XF86AudioRaiseVolume" =  "exec pactl set-sink-volume @DEFAULT_SINK@ +5% && ${vol-out}";
            "XF86AudioLowerVolume" =  "exec pactl set-sink-volume @DEFAULT_SINK@ -5% && ${vol-out}";
            "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
            "XF86MonBrightnessUp" = "exec brightnessctl set +5% | ${bright-out}";
            "XF86MonBrightnessDown" = "exec brightnessctl set 5%- | ${bright-out}";
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

