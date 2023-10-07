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
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  services.mullvad-vpn.enable = true;

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
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;

  security.polkit.enable = true;
  hardware.opengl.enable = true;
  
  programs.corectrl.enable = true;
  programs.corectrl.gpuOverclock.ppfeaturemask = "0xffffffff";
  programs.corectrl.gpuOverclock.enable = true;

  services.upower.enable = true;

# ZSH
  programs.zsh = {
    enable = true;
  };

  users.defaultUserShell = pkgs.zsh;
  #environment.shells = with pkgs; [ zsh ];

  xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      ];
    };

  programs.steam = {
    enable = true;
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

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ptc = {
    isNormalUser = true;
    initialPassword = "pass";
    extraGroups = [ "wheel" "audio" "video" "networkmanager" "corectrl" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
    ];
  };

  #environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  system.stateVersion = "23.05";
}
