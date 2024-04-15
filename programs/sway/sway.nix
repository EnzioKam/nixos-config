{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    autotiling
    brightnessctl
    libnotify
    shotman
    swaybg
    wdisplays
    wl-clipboard
    wl-mirror
  ];

  services.wob.enable = true;

  wayland.windowManager.sway = {
    enable = true;
    catppuccin.enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
    extraConfig = ''
      blur enable
      blur_xray disable
      blur_passes 3
      blur_radius 5
      layer_effects "waybar" blur enable; shadows enable;
      layer_effects "notifications" blur enable; shadows enable;
      corner_radius 10
      default_dim_inactive 0
    '';
    config = let
      wallpaper =
        "${config.home.homeDirectory}/.config/home-manager/wallpaper.png";
    in rec {
      defaultWorkspace = "workspace number 1";
      modifier = "Mod4";
      terminal = "footclient";
      floating.border = 0;
      window.border = 0;
      menu = "rofi -show drun";
      fonts = {
        names = [ "JetBrainsMono Nerd Font" ];
        size = 12.0;
      };
      gaps = { inner = 15; };
      colors = {
        background = "$base";
        focused = {
          border = "$lavender";
          background = "$base";
          text = "$text";
          indicator = "$rosewater";
          childBorder = "$lavender";
        };
        focusedInactive = {
          border = "$overlay0";
          background = "$base";
          text = "$text";
          indicator = "$rosewater";
          childBorder = "$overlay0";
        };
        unfocused = {
          border = "$overlay0";
          background = "$base";
          text = "$text";
          indicator = "$rosewater";
          childBorder = "$overlay0";
        };
        urgent = {
          border = "$peach";
          background = "$base";
          text = "$peach";
          indicator = "$overlay0";
          childBorder = "$peach";
        };
        placeholder = {
          border = "$overlay0";
          background = "$base";
          text = "$text";
          indicator = "$overlay0";
          childBorder = "$overlay0";
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
      keybindings = let
        vol-out =
          "wpctl get-volume @DEFAULT_AUDIO_SINK@ | sed 's/[^0-9]//g' > $WOBSOCK";
        bright-out = "sed -En 's/.*\\(([0-9]+)%\\).*/\\1/p' > $WOBSOCK";
      in pkgs.lib.mkOptionDefault {
        "${modifier}+q" = "kill";
        "${modifier}+Shift+q" = ''
          exec rofi -show power-menu \
            -modi 'power-menu:rofi-power-menu --choices=shutdown/reboot/suspend/hibernate/logout' \
            -theme-str 'window { width: 15%; } listview { lines: 6; }'
        '';
        "${modifier}+Shift+r" = "reload";
        "${modifier}+space" = "floating toggle";
        "${modifier}+p" = "move workspace to output right";
        "${modifier}+o" = "move workspace to output left";
        "${modifier}+l" = "exec swaylock --image ${wallpaper}";
        "${modifier}+s" = "exec shotman --capture region";
        "Mod1+Tab" = "exec rofi -show window";
        "Mod1+Control+Right" = "workspace next";
        "Mod1+Control+Left" = "workspace prev";
        "XF86AudioRaiseVolume" =
          "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ && ${vol-out}";
        "XF86AudioLowerVolume" =
          "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- && ${vol-out}";
        "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86MonBrightnessUp" = "exec brightnessctl set +5% | ${bright-out}";
        "XF86MonBrightnessDown" = "exec brightnessctl set 5%- | ${bright-out}";
        "${modifier}+bracketleft" =
          "exec brightnessctl -d 'tpacpi::kbd_backlight' s 1-";
        "${modifier}+bracketright" =
          "exec brightnessctl -d 'tpacpi::kbd_backlight' s +1";
      };
      input = {
        "1:1:AT_Translated_Set_2_keyboard" = { xkb_options = "ctrl:swapcaps"; };
      };
      output = { "*" = { bg = "${wallpaper} fill"; }; };
    };
  };
}

