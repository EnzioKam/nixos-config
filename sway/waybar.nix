{pkgs, ...}:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [
          "sway/workspaces"
          "sway/mode"
        ];
        modules-center = [
          "tray"
          "clock"
        ];
        modules-right = [
          "network"
          "pulseaudio"
          "temperature"
          "disk"
          "cpu"
          "memory"
          "backlight"
          "battery"
        ];
  
        tray = {
          icon-size = 20;
          spacing = 10;
        };

        network = {
          format-wifi = "󰤨 {essid}";
          format-disconnected = "󰤭 ";
          format-ethernet = "󰈀 ";
          tooltip = false;
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰖁";
          format-icons = ["" "" ""];
          scroll-step = 5;
          tooltip = false;
        };

        temperature = {
          format = "󰔏 {temperatureC} °C";
          format-critical = "󰔏 {temperatureC} °C";
          critical-threshold = 80;
        }

        cpu = {
          format = " {}%";
          tooltip = false;
        };

        memory = {
          format = "󰍛 {}%";
          tooltip = false;
        };

        disk = {
          format = "󰋊 {free}";
          tooltip = false;
        };

        backlight = {
          device = "intel_backlight";
          format = "{icon} {percent}%";
          format-icons = ["" "" "" "" "" "" "" "" ""];
          tooltip = false;
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰂄 {capacity}%";
          format-icons = ["󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          tooltip = false;
        };

        clock = {
          format = "{:%H:%M}";
          format-alt = "{:%d %m %Y}";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
        };
      };
    };

    style = builtins.readFile ./style.css;
  };

  xdg.configFile."waybar/mocha.css".text =
    builtins.readFile ./mocha.css;
}
