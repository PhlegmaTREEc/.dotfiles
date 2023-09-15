{ config, pkgs, ... }:

{
  home.username = "ptc";
  home.homeDirectory = "/home/ptc";

  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    zsh
    # TTY
    bat
    broot
    duf
    du-dust
    fd
    ffmpeg_6
    fzf
    gcc
    git
    imagemagick
    lazygit
    lf
    lsd
    mupdf
    navi
    neofetch
    neovim
    nodejs_18
    poppler_utils
    ripgrep
    starship
    steam
    trash-cli
    tree
    unzip
    wget
    wl-clipboard
    zoxide
    # Gui
    adw-gtk3
    alsa-tools
    blueman
    bluez
    bluez-alsa
    corectrl
    dracula-theme
    dracula-icon-theme
    emacs29-pgtk
    filezilla
    firefox
    gparted
    kitty
    imv
    pavucontrol
    nwg-look
    mpv
    mullvad-vpn
    multiviewer-for-f1
    openrgb
    opentabletdriver
    solaar
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
    # hyprland
    waybar
    gammastep
    grim
    fuzzel
    slurp
    swaynotificationcenter
    swappy
    swaybg
    watershot

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
  ];

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
    ".config/swaync" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/modules/swaync";
      }; 
    ".config/waybar" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/modules/waybar";
      }; 
    };

  #programs.fzf = {
  #  history
  #  historyWidgetOptions = [
  #    "--preview 'echo {}' --preview-window up:3:hidden:wrap"
  #    "--bind 'ctrl-/:toggle-preview'"
  #    "--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'"
  #    "--color header:italic"
  #    "--header 'Press CTRL-Y to copy command into clipboard'"
  #    ];
  #  };

  # ZSH
  programs.zsh = {
    enable = true;
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
  
  # test with config for hyprland
  wayland.windowManager.hyprland.extraConfig = ''
    source=~/.dotfiles/home/modules/hypr/hyprland.conf
  '';

  # Session variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
