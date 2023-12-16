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
  boot.loader.systemd-boot.configurationLimit = 15;
  boot.loader.timeout = 2;

  boot.kernelPackages = pkgs.linuxPackages_6_6;

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
  
  # Solaar + logitech
  hardware.logitech.wireless = {
    enable = true;
    enableGraphical = true;
  };

  services.fstrim = {
    enable = true;
    interval = "weekly";
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = [ pkgs.amdvlk ];
    extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
  };
  
  # Polkit
  security.polkit.enable = true;
  #systemd = {
  #  user.services.polkit-gnome-authentication-agent-1 = {
  #    description = "polkit-gnome-authentication-agent-1";
  #    wantedBy = [ "graphical-session.target" ];
  #    wants = [ "graphical-session.target" ];
  #    after = [ "graphical-session.target" ];
  #    serviceConfig = {
  #        Type = "simple";
  #        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  #        Restart = "on-failure";
  #        RestartSec = 1;
  #        TimeoutStopSec = 10;
  #      };
  #  };
  #};

  systemd.extraConfig = ''
    DefaultTimeoutStopSec=20s
  '';
  
  #programs.corectrl = {
  #  enable = true;
  #  gpuOverclock.ppfeaturemask = "0xffffffff";
  #  gpuOverclock.enable = true;
  #};

  services.upower.enable = true;

  programs.zsh = {
    enable = true;
  };
  users.defaultUserShell = pkgs.zsh;

  xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
      ];
      config.common.default = "*";
    };

  programs.steam = {
    enable = true;
  };

  programs.gamemode.enable = true;

  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
      ];
    };
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

  # NIX and nixos
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  nix.settings.auto-optimise-store = true;

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
  };

  environment.variables = {
    NIXOS_OZONE_WL = "1";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GDK_BACKEND = "wayland,x11";
    CLUTTER_BACKEND = "wayland";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    MOZ_ENABLE_WAYLAND = "1";
    #SDL_VIDEODRIVER = "wayland"; #Remove or set to x11 if games that provide older versions of SDL cause compatibility issues
    _JAVA_AWT_WM_NONREPARENTING = "1";
    XCURSOR_SIZE = "24";
    #XCURSOR_THEME
  };

  environment.systemPackages = with pkgs; [
    gnome.gnome-disk-utility
    mangohud
    ventoy-full
    vim
    virt-manager
    lxqt.lxqt-policykit
  ];

  # save setting fot Thunar
  programs.xfconf.enable = true;

  services.tumbler.enable = true;

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
