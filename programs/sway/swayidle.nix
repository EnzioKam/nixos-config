{ pkgs, ... }:

{
  services.swayidle = {
    enable = true;
    systemdTarget = "sway-session.target";
    timeouts = [{
      timeout = 900;
      command = "${pkgs.systemd}/bin/systemctl suspend";
    }];
  };
}

