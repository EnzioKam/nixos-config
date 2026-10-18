{ pkgs, ... }:

{
  catppuccin = {
    bat.enable = true;
    bottom.enable = true;
    fzf.enable = true;
    delta.enable = true;
    zellij.enable = true;
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        ForwardAgent = false;
        AddKeysToAgent = "no";
        Compression = false;
        ServerAliveInterval = 0;
        ServerAliveCountMax = 3;
        HashKnownHosts = false;
        UserKnownHostsFile = "~/.ssh/known_hosts";
        ControlMaster = "no";
        ControlPath = "~/.ssh/master-%r@%n:%p";
        ControlPersist = "no";
      };
      "eu.nixbuild.net" = {
        ServerALiveInterval = 60;
        IdentityFile = "~/.ssh/my-nixbuild-key";
      };
      stfjump = {
        HostName = "stfjump.comp.nus.edu.sg";
        User = "ekam";
        IdentityFile = "~/.ssh/socjump";
        IdentitiesOnly = "yes";
      };
      "*.comp.nus.edu.sg !stfjump.comp.nus.edu.sg" = {
        User = "ekam";
        ProxyJump = "stfjump";
      };
    };
  };

  programs.bat.enable = true;
  programs.bottom.enable = true;
  programs.eza.enable = true;

  programs.fzf = {
    enable = true;
    defaultCommand = "fd -H";
  };

  programs.git = {
    enable = true;
    settings.user = {
      name = "EnzioKam";
      email = "enziokamhh@gmail.com";
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };

  programs.java = {
    enable = true;
    package = pkgs.jdk21;
  };

  programs.zellij = {
    enable = true;
  };
}
