{ config, pkgs, lib, nixvim,... }:

{
  home.username = "ptc";
  home.homeDirectory = "/home/ptc";

  home.stateVersion = "23.05"; # Please read the comment before changing.

  #programs.nixvim = {
  #  enable = true;
  #  colorschemes.dracula.enable = true;
  #  plugins.lualine.enable = true;
  #};

  home.packages = with pkgs; [
    bazecor
    bat bat-extras.prettybat bat-extras.batwatch bat-extras.batpipe bat-extras.batman bat-extras.batgrep bat-extras.batdiff
    bottom broot
    cliphist
    duf du-dust
    exiftool
    fd ffmpeg_6
    gcc git glib
    hugo
    imagemagick
    jq
    lazygit lf libnotify lsd
    mupdf
    neovim
    navi nodejs_18
    p7zip
    poppler_utils
    ripgrep rclone
    starship steam
    trash-cli tree tree-sitter
    unzip upower
    vulkan-tools
    wev #wayland event viewer - prints input events
    wget wl-clipboard
    xdg-utils
    zoxide
    # Speedtest net
    speedtest-cli
    fast-cli
    # Benchmark
    geekbench
    glmark2
    stress-ng
    sysbench
    #unigine-superposition
    unigine-valley
    # Gui
    alsa-tools
    blueman bluez bluez-alsa
    easyeffects
    filezilla firefox floorp
    libsForQt5.ark
    libsForQt5.dolphin
    libsForQt5.dolphin-plugins
    libsForQt5.kio
    libsForQt5.kio-extras
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    qt6Packages.qt6ct
    qt6Packages.qtstyleplugin-kvantum
    kitty
    #lact
    imv
    dracula-theme
    dracula-icon-theme
    papirus-icon-theme papirus-folders
    pasystray pavucontrol
    mpv multiviewer-for-f1
    openrgb opentabletdriver
    qpwgraph
    solaar
    webp-pixbuf-loader
    #udiskie
    #devmon + service alternative to udisk?
    zathura
    # hyprland
    hyprland
    fuzzel
    gammastep
    grim
    hyprshot
    slurp
    swappy
    swaybg
    swaynotificationcenter
    waybar
    watershot
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    xwayland.enable = true;
    extraConfig = ''
      source=~/.dotfiles/home/modules/hypr/hyprland.conf
    '';
    };

  home.file = {
    ".config/broot" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/modules/broot";
      }; 
    ".config/easyeffects" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/modules/easyeffects";
      }; 
    ".config/fuzzel" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/modules/fuzzel";
      }; 
    ".config/gammastep" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/modules/gammastep";
      }; 
    ".config/kitty" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/modules/kitty";
      }; 
    ".config/lazygit" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/modules/lazygit";
      }; 
    ".config/lf" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/modules/lf";
      };
    ".config/navi" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/modules/navi";
      }; 
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/modules/nvim";
      }; 
    ".config/sioyek" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/modules/sioyek";
      }; 
    ".config/starship" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/modules/starship";
      }; 
    ".config/swappy" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/modules/swappy";
      }; 
    ".config/swaync" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/modules/swaync";
      }; 
    ".config/waybar" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/modules/waybar";
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
    enableAutosuggestions = true;
    enableCompletion = true;
    completionInit = ''
    autoload -Uz compinit && compinit
    zstyle ':completion:*' completer _complete _ignored
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
    '';
    history.path = "$HOME/.config/zsh/.zsh_history";
    initExtra = ''
    if [ -f ~/.dotfiles/home/modules/zsh/.shell_config ]; then
        source ~/.dotfiles/home/modules/zsh/.shell_config
    fi

    if [ -f ~/.dotfiles/home/modules/zsh/.shell_aliases ]; then
	    source ~/.dotfiles/home/modules/zsh/.shell_aliases
    fi
    '';
    syntaxHighlighting.enable = true;
  };
  
  ### MAKE BACKUP OF BASIC FOLDERS BEFORE TRYING THIS OPTION
  #xdg = {
  #  userDirs = {
  #      enable = true;
  #      createDirectories = true;
  #  };
  #};

  #xdg.mime.enable = true;
  #xdg.mimeApps = {
  #  enable = true;
  #  defaultApplications = {
  #    "image/png" = ["imv.desktop"];
  #    "image/jpg" = ["imv.desktop"];
  #    "image/webp" = ["imv.desktop"];
  #    "x-scheme-handler/http" = ["firefox.desktop"];
  #    "x-scheme-handler/https" = ["firefox.desktop"];
  #    "application/x-extension-htm" = ["firefox.desktop"];
  #    "application/x-extension-html" = ["firefox.desktop"];
  #    "application/x-extension-shtml" = ["firefox.desktop"];
  #    "application/xhtml + xml" = ["firefox.desktop"];
  #    "application/x-extension-xhtml" = ["firefox.desktop"];
  #    "application/x-extension-xht" = ["firefox.desktop"];
  #    "text/html" = ["firefox.desktop"];
  #  };
  #};

  qt = {
    enable = true;
    #style.name = kvantum;
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
      name = "Dracula";
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
