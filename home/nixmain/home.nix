{ config, pkgs, lib, nixvim, inputs, ... }:

{
  home.username = "ptc";
  home.homeDirectory = "/home/ptc";

  home.stateVersion = "23.05"; # Please read the comment before changing.

  imports =
    [
      ../optional/tmux.nix
    ];

  home.packages = with pkgs; [
    kitty
    bazecor
    #bcor
    bat bat-extras.prettybat bat-extras.batwatch bat-extras.batpipe bat-extras.batman bat-extras.batgrep bat-extras.batdiff
    bottom broot
    cliphist
    duf du-dust
    exiftool
    fastfetch fd ffmpeg_6 ffmpegthumbnailer
    gcc git glib
    hugo
    imagemagick
    jq
    lazygit lf libnotify lsd
    neovim
    navi nodejs_18
    p7zip
    poppler_utils
    ripgrep rclone
    starship steam
    trash-cli tree tree-sitter
    unzip upower unar
    vulkan-tools
    wev #wayland event viewer - prints input events
    wget wl-clipboard
    xdg-utils
    yazi
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
    unigine-valley
    # Gui
    ardour
    alsa-tools
    blueman bluez bluez-alsa
    easyeffects
    filezilla #floorp
    gnome.gnome-sound-recorder
    nautilus
    file-roller
    gnome-calculator
    gnome-disk-utility
    loupe
    gimp
    krita
    libsForQt5.qt5ct
    kdePackages.qt6ct
    qpwgraph
    imv
    dracula-theme
    dracula-icon-theme
    paper-clip
    parabolic
    papirus-icon-theme papirus-folders
    pasystray pavucontrol
    mpv myMulti
    openrgb opentabletdriver
    #protonmail-desktop
    solaar
    switcheroo
    webp-pixbuf-loader
    upscayl
    #udiskie
    #devmon + service alternative to udisk?
    #teams-for-linux
    ventoy-full
    zoom-us
    # hyprland "environment"
    hyprcursor
    hypridle
    hyprlock
    hyprlang
    hyprpaper
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
    xwayland.enable = true;
    extraConfig = ''
      source = /home/ptc/.dotfiles/home/dotconfig/hypr/hyprland.conf
    '';
    };

  home.file = {
    ".config/hypr/hyprpaper" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/hypr/hyprpaper.conf";
      }; 
    ".config/easyeffects" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/easyeffects";
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
    ".config/lazygit" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/lazygit";
      }; 
    ".config/navi" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/navi";
      }; 
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/nvim";
      }; 
    ".config/sioyek" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/sioyek";
      }; 
    ".config/starship" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/starship";
      }; 
    ".config/swappy" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/swappy";
      }; 
    ".config/swaync" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/swaync";
      }; 
    ".config/yazi" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/yazi";
      }; 
    ".config/waybar" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/waybar";
      }; 
    };

  programs.firefox = {
    enable = true;
    profiles.ptc = {
      # https://github.com/MrOtherGuy/firefox-csshacks
      userChrome = ''
      /* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/toggle_tabs_toolbar_with_alt.css made available under Mozilla Public License v. 2.0
      See the above repository for updates as well as full license text. */
      
      /* Show tabs toolbar with Alt-key. Menubar must be disabled for this to work */
      
      #titlebar { -moz-appearance: none !important }
      :root[tabsintitlebar][sizemode="maximized"]{ padding-top: 1px !important; }
      #titlebar:not(:hover) > #toolbar-menubar[autohide="true"][inactive] + #TabsToolbar { visibility: collapse }
      
      /* Behavior 1 - Alt-key toggles menubar as normal */
      #titlebar:hover > #toolbar-menubar[autohide="true"]{ height: calc(var(--tab-min-height) + var(--space-above-tabbar) - var(--tabs-navbar-shadow-size)) !important; }
      
      /* Behavior 2 - Alt-key only shows tabs toolbar */
      /* To show window controls, hit Alt again while cursor is over tabs toolbar */
      /*
      #toolbar-menubar[autohide]:not([inactive]),
      #toolbar-menubar[autohide="true"]:not([inactive]) + #TabsToolbar > .titlebar-buttonbox-container{ visibility: collapse !important }
      */
      '';
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9"
      "--color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9"
      "--color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6"
      "--color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"
    ];
  };

  programs.zsh = {
    enable = true;
    package = pkgs.zsh;
    dotDir = ".config/zsh";
    autosuggestion.enable = true;
    enableCompletion = true;
    completionInit = ''
    autoload -Uz compinit && compinit
    zstyle ':completion:*' completer _complete _ignored
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
    '';
    history.path = "$HOME/.config/zsh/.zsh_history";
    initExtra = ''
    if [ -f ~/.dotfiles/home/dotconfig/zsh/.shell_config ]; then
        source ~/.dotfiles/home/dotconfig/zsh/.shell_config
    fi

    if [ -f ~/.dotfiles/home/dotconfig/zsh/.shell_aliases ]; then
	    source ~/.dotfiles/home/dotconfig/zsh/.shell_aliases
    fi
    '';
    syntaxHighlighting.enable = true;
  };

  #programs.nixvim = {
  #  enable = true;
  #  colorschemes.dracula.enable = true;
  #  plugins.lualine.enable = true;
  #};

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
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
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
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
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

  # Session variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
