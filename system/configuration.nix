{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Boot loader
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.cpu.amd.updateMicrocode = true;

  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
    };

  # Networking
  networking.firewall.enable = true;
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad;
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
    };
  };
  
  # Solaar + logitech
  hardware.logitech.wireless = {
    enable = true;
    enableGraphical = true;
  };

  security.polkit.enable = true;
  hardware.opengl.enable = true;
  
  programs.corectrl = {
    enable = true;
    gpuOverclock.ppfeaturemask = "0xffffffff";
    gpuOverclock.enable = true;
  };

  services.upower.enable = true;

  programs.zsh = {
    enable = true;
  };
  users.defaultUserShell = pkgs.zsh;

  xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      ];
    };

  programs.steam = {
    enable = true;
    #package = steam;
  };

  services.flatpak.enable = true;

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "Ubuntu" ]; })
  ];

  # Set your time zone.
  time.timeZone = "Europe/Prague";

  nix.settings = {
     experimental-features = [ "nix-command" "flakes" ];
     substituters = ["https://hyprland.cachix.org"];
     trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
     };
  nixpkgs.config.allowNonFree = true;
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-run"
  ];

  # Enable sound.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;
  };

  # storage
  # device moutings
  services.gvfs = {
    enable = true;
    package = pkgs.gvfs;
  };
  services.udisks2 = {
    enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ptc = {
    isNormalUser = true;
    initialPassword = "pass";
    extraGroups = [ "wheel" "audio" "video" "networkmanager" "corectrl" "storage" "libvirtd" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    virt-manager
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Virtual machine
  virtualisation.libvirtd.enable = true;
  programs.dconf.enable = true;

  system.stateVersion = "23.05";
}
