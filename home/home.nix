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
    fzf
    gcc
    git
    lazygit
    lf
    lsd
    navi
    neofetch
    neovim
    nodejs_18
    poppler
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
    alsa-tools
    blueman
    bluez
    bluez-alsa
    corectrl
    filezilla
    firefox
    gparted
    kitty
    pavucontrol
    ## nwg-look
    ## lxappearance
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
    swaynotificationcenter
    swappy
    swaybg
    watershot
    #xdg-desktop-portal-gtk
    #xdg-desktop-portal-hyprland

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # old an incorrect solution example
  #xdg.configFile.waybar = {
  #  source = ./modules/waybar;
  #  recursive = true;
  #  };

  home.file.".config/hypr" = {
    source = config.lib.file.mkOutOfStoreSymlink /home/ptc/.dotfiles/home/modules/hypr;
    recursive = true;
  };
  #home.file."${config.xdg.configHome}" = {
  #  source = ./modules;
  #  recursive = true;
  #};

  # ZSH
  programs.zsh = {
    enable = true;
    #dotDir = ".config/zsh";
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    #autosuggestions.enable = true;
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "0.7.0";
          sha256 = "1g3pij5qn2j7v7jjac2a63lxd97mcsgw6xq6k5p7835q9fjiid98";
          };
        }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.7.1";
          sha256 = "03r6hpb5fy4yaakqm3lbf4xcvd408r44jgpv4lnzl9asp4sb9qc0";
          };
        }
    ];
  };
  #users.defaultUserShell = pkgs.zsh;

  # Session variables
  home.sessionVariables = {
    EDITOR = "nvim";
    #ZDOTDIR = "$HOME/.config/zsh";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
