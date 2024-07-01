{
  programs.waybar = {
    enable = true;
    catppuccin.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [ "sway/workspaces" "sway/mode" ];
        modules-center = [ "tray" "clock" ];
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
          format-icons = [ "" "" "" ];
          scroll-step = 5;
          tooltip = false;
        };

        temperature = {
          format = "󰔏 {temperatureC}°C";
          format-critical = "󰔏 {temperatureC}°C";
          critical-threshold = 80;
          tooltip = false;
          hwmon-path-abs = "/sys/devices/platform/thinkpad_hwmon/hwmon";
          input-filename = "temp1_input";
        };

        cpu = {
          format = " {}%";
          tooltip = false;
        };

        memory = {
          format = "󰍛 {}%";
          tooltip = false;
        };

        disk = {
          format = "󰋊 {percentage_free}%";
          tooltip-format = "{free} / {total}";
        };

        backlight = {
          device = "intel_backlight";
          format = "{icon} {percent}%";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
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
          format-icons = [ "󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          tooltip = false;
        };

        clock = {
          format = "{:%H:%M}";
          format-alt = "{:%d/%m/%Y}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<span color='#f9e2af'><b>{}</b></span>";
              days = "<span color='#f5c2e7'><b>{}</b></span>";
              weeks = "<span color='#94e2d5'><b>W{}</b></span>";
              weekdays = "<span color='#fab387'><b>{}</b></span>";
              today = "<span color='#f38ba8'><b><u>{}</u></b></span>";
            };
          };
        };
      };
    };

    style = builtins.readFile ./style.css;
  };
}
