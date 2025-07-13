{ config, pkgs, lib, inputs, ... }:

{
  home.username = "ptc";
  home.homeDirectory = "/home/ptc";

  home.stateVersion = "23.05"; # Please read the comment before changing.

  imports =
    [
      ../core/default.nix
      ../optional/sound.nix
    ];

  home.packages = with pkgs; [
    #zellij
    wezterm
    kitty
    amdgpu_top
    brave
    bazecor
    exiftool
    ffmpeg_6 ffmpegthumbnailer
    glib
    hugo
    imagemagick
    libnotify
    nodejs_20
    poppler_utils
    steam
    vulkan-tools
    wev #wayland event viewer - prints input events
    xdg-utils
    # Speedtest net
    speedtest-cli
    fast-cli
    # Benchmark
    memtester
    mprime
    geekbench
    stress
    s-tui
    glmark2
    stress-ng
    sysbench
    # Gui
    alsa-tools
    blueman bluez bluez-alsa
    gnome-sound-recorder
    nautilus
    file-roller
    gnome-disk-utility
    libsForQt5.qt5ct
    kdePackages.qt6ct
    qpwgraph
    imv
    dracula-theme
    dracula-icon-theme
    papirus-icon-theme papirus-folders
    pasystray pavucontrol
    mpv myMulti
    #openrgb
    solaar
    webp-pixbuf-loader
    #udiskie
    #devmon + service alternative to udisk?
    #teams-for-linux
    #zoom-us
    # hyprland "environment"
    #hyprcursor
    hypridle
    hyprlock
    hyprlang
    hyprland-qtutils
    waybar
    fuzzel
    gammastep
    grim
    hyprshot
    slurp
    swappy
    swaynotificationcenter
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    systemd.enable = true;
    systemd.variables = ["--all"];
    xwayland.enable = true;
    extraConfig = ''
      source = /home/ptc/.dotfiles/home/dotconfig/hypr/hyprland.conf
    '';
    };

  home.file = {
    ".config/bat" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/bat";
      }; 
    ".config/fuzzel" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/fuzzel";
      }; 
    ".config/gammastep" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/gammastep";
      }; 
    ".config/kitty" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/kitty";
      }; 
    ".config/ghostty" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/ghostty";
      }; 
    ".config/wezterm" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/wezterm";
      }; 
    ".config/sioyek" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/sioyek";
      }; 
    ".config/swappy" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/swappy";
      }; 
    ".config/swaync" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/swaync";
      }; 
    ".config/waybar" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/waybar";
      }; 
    ".config/tmux" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/tmux";
      }; 
    };

  programs.firefox = {
    enable = true;
    profiles.ptc = {
      bookmarks.force = true;
      bookmarks.settings = [];
      isDefault = true;
    };
  };

  ### MAKE BACKUP OF BASIC FOLDERS BEFORE TRYING THIS OPTION
  #xdg = {
  #  userDirs = {
  #      enable = true;
  #      createDirectories = true;
  #  };
  #};

  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-dark";
    size = 32;
  };

  gtk = {
    #Flatpak note: in flatseal add Variables: GTK_THEME=Adwaita:dark to use dark theme
    enable = true;
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
      #name = "Papirus-Dark";
      #package = pkgs.papirus-folders;
      #package = pkgs.papirus-folders.override {
      #  folderColor = "violet";
    };
    cursorTheme = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-dark";
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
        '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
        '';
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
