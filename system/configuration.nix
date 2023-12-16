{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 15;
      timeout = 2;
    };
    # Kernel version
    kernelPackages = pkgs.linuxPackages_6_6;
  };

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
      XCURSOR_SIZE = "24";
      #XCURSOR_THEME
    };
    systemPackages = with pkgs; [
      gnome.gnome-disk-utility
      mangohud
      ventoy-full
      vim
      virt-manager
      lxqt.lxqt-policykit
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
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = [ pkgs.amdvlk ];
      extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
    };
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };

  networking = {
    firewall.enable = true;
    hostName = "nixos";
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
    allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-run"
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
        ];
      };
    };
  };

  programs = {
    #corectrl = {
    #  enable = true;
    #  gpuOverclock.ppfeaturemask = "0xffffffff";
    #  gpuOverclock.enable = true;
    #};
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
  };

  services = {
    blueman.enable = true;
    flatpak.enable = true;
    fstrim = {
      enable = true;
      interval = "weekly";
    };
    gvfs = {
      enable = true;
      package = pkgs.gvfs;
    };
    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad;
    };
    openssh.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # jack.enable = true;
    };
    # Thumbaniling program
    tumbler.enable = true;
    udisks2 = {
      enable = true;
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
  };

  # Set timezone
  time.timeZone = "Europe/Prague";
  
  # Define users
  users = {
    users.ptc = {
      isNormalUser = true;
      initialPassword = "pass"; # change password after install!!!
        extraGroups = [ "wheel" "audio" "video" "networkmanager" "corectrl" "storage" "libvirtd" ]; # Enable ‘sudo’ for the user.
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
