{
  services.swayidle = {
    enable = true;
    systemdTarget = "sway-session.target";
    timeouts = [
      {
        timeout = 300;
        command = "systemctl suspend";
      }
    ];
  };
}

