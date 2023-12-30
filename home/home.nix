{ config, pkgs, ... }:

{
  home.username = "ptc";
  home.homeDirectory = "/home/ptc";

  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
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
    navi neovim nodejs_18
    p7zip
    poppler_utils
    ripgrep rclone
    starship steam
    trash-cli tree
    unzip upower
    vulkan-tools
    wget wl-clipboard
    xdg-utils
    zoxide
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
    filezilla firefox
    gnome.file-roller
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    kitty
    #lact
    imv
    papirus-icon-theme papirus-folders
    pasystray pavucontrol
    mpv multiviewer-for-f1
    openrgb opentabletdriver
    qpwgraph
    solaar
    xfce.thunar xfce.thunar-volman xfce.thunar-archive-plugin xfce.thunar-archive-plugin xfce.thunar-media-tags-plugin
    webp-pixbuf-loader
    #udiskie
    #devmon + service alternative to udisk?
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

  # ZSH
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

  gtk = {
    enable = true;
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-folders;
      #package = pkgs.papirus-folders.override {
      #  folderColor = "violet";
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
