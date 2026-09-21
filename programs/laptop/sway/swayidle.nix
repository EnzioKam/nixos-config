{ pkgs, ... }:

{
  services.swayidle = {
    enable = true;
    systemdTargets = [ "sway-session.target" ];
    timeouts = [
      {
        timeout = 900;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
}
