# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, auto-cpufreq-src, ... }:

let

  auto-cpufreq_overlay = (self: super: {
    auto-cpufreq = super.auto-cpufreq.overrideAttrs(old: {
      src = auto-cpufreq-src;
      propagatedBuildInputs = with super.python3Packages; [
        click
        distro
        psutil
        setuptools
        requests
      ];
      patches = [];
      postPatch = ''
        sed -i setup.py \
        -e 's|"setuptools-git-versioning"||'
        sed -i auto_cpufreq/core.py \
        -e 's|/usr/local/share/auto-cpufreq/scripts/|/run/current-system/sw/bin/|' \
        -e 's|def cpufreqctl():|def cpufreqctl():\n    pass\n    return|' \
        -e 's|def cpufreqctl_restore():|def cpufreqctl_restore():\n    pass\n    return|' \
        -e 's|def deploy_daemon():|def deploy_daemon():\n    pass\n    return|' \
        -e 's|def deploy_daemon_performance():|def deploy_daemon_performance():\n    pass\n    return|' \
        -e 's|def remove():|def remove():\n    pass\n    return|' \
        -e 's|def app_version():|def app_version():\n    print("auto-cpufreq version: @version@")\n    print("Git commit: v@version@")\n    pass\n    return|'
        sed -i scripts/auto-cpufreq.service \
        -e '/^WorkingDirectory=/d' \
        -e '/^Environment=/d' \
        -e 's|ExecStart=.*/bin|ExecStart='$out'/bin|'
      '';
       postInstall = ''
        cp scripts/cpufreqctl.sh $out/bin/cpufreqctl.auto-cpufreq
        mkdir -p $out/lib/systemd/system
        cp scripts/auto-cpufreq.service $out/lib/systemd/system/auto-cpufreq.service
      '';
    });
  });

in {
  imports =
  [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  nix.nixPath = [
    "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
    # "nixos-config=/etc/nixos/configuration.nix"
    "nixos-config=/home/enziokam/.config/home-manager/configuration.nix"
    "/nix/var/nix/profiles/per-user/root/channels"
  ];

  nixpkgs.overlays = [ auto-cpufreq_overlay ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [
    "amd_pstate=active"
  ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable bluetooth support
  hardware.bluetooth.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Singapore";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_SG.utf8";

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Enable the XFCE Desktop Environment.
  # services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.desktopManager.xfce.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable GVFs virtual filesystem support
  services.gvfs.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable fwupd for firmware updates
  services.fwupd.enable = true;

  services.auto-cpufreq.enable = true;

  programs.zsh.enable = true;
  programs.dconf.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.enziokam = {
    isNormalUser = true;
    description = "Enzio Kam Hai Hong";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "video"];
    # packages = with pkgs; [
    #  firefox
    #  thunderbird
    # ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    # wget
    lm_sensors
    at-spi2-atk
    dmidecode
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

  security.polkit.enable = true;

  security.pam.services.swaylock.text = ''
    # Account management
    account required pam_unix.so
    # Authentication management
    auth sufficient pam_unix.so   likeauth try_first_pass
    auth required pam_deny.so
    # Password management
    password sufficient pam_unix.so nullok sha512
    # Session management
    session required pam_env.so conffile=/etc/pam/environment readenv=0
    session required pam_unix.so
  '';

  # Hardware Support for Wayland Sway
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
    };
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };
}
