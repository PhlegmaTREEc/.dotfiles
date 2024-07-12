{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../desktop-modules/greetd.nix
    ];

  home-manager.users.ptc = import ../../home/nixmain/home.nix;

  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.memtest86.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 15;
      timeout = 2;
    };
    # Use specific kernel branch
    kernelPackages = pkgs.linuxPackages_latest;
  };
  
  #i18n.defaultLocale = "cs_CZ.UTF-8";
  #i18n.extraLocaleSettings = {
  #  LC_CTYPE = "cs_CZ.UTF-8";
  #};

  environment = {
    variables = {
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
      XCURSOR_SIZE = "16";
      HYPRCURSOR_THEME = "HyprBibataModernClassicSVG";
      HYPRCURSOR_SIZE = "16";

    };
    systemPackages = with pkgs; [
      logitech-udev-rules
      mangohud
      polkit_gnome
      ventoy-full
      vim
      virt-manager
      wireguard-tools
    ];
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "Ubuntu" ]; })
  ];

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    cpu.amd.updateMicrocode = true;
    # Added for Solaar
    logitech.wireless = {
      enable = true;
      enableGraphical = true;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = [ pkgs.amdvlk ];
      extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
    };
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };

  networking = {
    #interfaces.enp4s0.ipv4.addresses = [ {
    #  address = "192.168.1.51";
    #  prefixLength = 24;
    #} ];
    firewall = {
      enable = true;
      };
    hostName = "nixmain";
    networkmanager.enable = true;
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config = {
    allowNonFree = true;
    allowUnFree = true;
    allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-run"
      "libXNVCtrl" #????
    ];
    packageOverrides = pkgs: {
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
          ncurses
        ];
      };
    };
  };

  programs = {
    corectrl = {
      enable = true;
      #gpuOverclock.ppfeaturemask = "0xffffffff";
      gpuOverclock.ppfeaturemask = "0xfffd7fff";
      gpuOverclock.enable = true;
    };
    dconf.enable = true;
    gamemode.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    steam = {
      enable = true;
    };
    xfconf.enable = true;
    zsh = {
      enable = true;
    };
    nautilus-open-any-terminal = {
      enable = true;
      terminal = "kitty";
    };
  };

  services = {
    blueman.enable = true;
    flatpak.enable = true;
    fstrim = {
      enable = true;
      interval = "weekly";
    };
    gnome.sushi.enable = true;
    gvfs = {
      enable = true;
      package = pkgs.gvfs;
    };
    openssh.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
      # jack.enable = true;
    };
    # Thumbaniling program
    resolved.enable = true;
    tumbler.enable = true;
    udisks2 = {
      enable = true;
    };
    udev = {
      enable = true;
      packages = with pkgs; [
        bazecor
      ];
    };
    upower.enable = true;
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  systemd = {
    extraConfig = ''
      DefaultTimeoutStopSec=20s
      '';
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

  # Set timezone
  time.timeZone = "Europe/Prague";
  
  # Define users
  users = {
    users.ptc = {
      isNormalUser = true;
      initialPassword = "password"; # change password after install!!!
      extraGroups = [ "wheel" "audio" "video" "networkmanager" "corectrl" "storage" "libvirtd" "dialout" ]; # Enable ‘sudo’ for the user.
      useDefaultShell = true;
    };
    defaultUserShell = pkgs.zsh;
  };

  # Enable virtualisation
  virtualisation.libvirtd.enable = true;

  xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
      ];
      config.common.default = "*";
    };
  
  system.stateVersion = "23.05";
}
