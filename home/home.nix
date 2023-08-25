{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ptc";
  home.homeDirectory = "/home/ptc";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    zsh
    # TTY
    bat
    broot
    duf
    du-dust
    fd
    fzf
    git
    lazygit
    lf
    lsd
    navi
    neovim
    poppler
    ripgrep
    starship
    trash-cli
    tree
    wget
    wl-clipboard
    zoxide
    # Gui
    alsa-tools
    blueman
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
    #xdg-desktop-portal-gtk
    #xdg-desktop-portal-hyprland
    gammastep
    fuzzel
    swaynotificationcenter
    hyprpaper

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

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  xdg.configFile.hypr = {
    source = ./modules/hyprland;
    recursive = true;
    };

  xdg.configFile.broot = {
    source = ./modules/broot;
    recursive = true;
    };

  xdg.configFile.dunst = {
    source = ./modules/dunst;
    recursive = true;
    };

  xdg.configFile.easyeffects = {
    source = ./modules/easyeffects;
    recursive = true;
    };

  xdg.configFile.fuzzel = {
    source = ./modules/fuzzel;
    recursive = true;
    };

  xdg.configFile.gammastep = {
    source = ./modules/gammastep;
    recursive = true;
    };

  xdg.configFile.kitty = {
    source = ./modules/kitty;
    recursive = true;
    };

  xdg.configFile.lazygit = {
    source = ./modules/lazygit;
    recursive = true;
    };

  xdg.configFile.lf = {
    source = ./modules/lf;
    recursive = true;
    };

  xdg.configFile.navi = {
    source = ./modules/navi;
    recursive = true;
    };

  xdg.configFile.nvim = {
    source = ./modules/nvim;
    recursive = true;
    };

  xdg.configFile.sioyek = {
    source = ./modules/sioyek;
    recursive = true;
    };
  
  xdg.configFile.swaync = {
    source = ./modules/swaync;
    recursive = true;
    };
  
  xdg.configFile.starship = {
    source = ./modules/starship.toml;
    recursive = true;
    };
  
  xdg.configFile.waybar = {
    source = ./modules/waybar;
    recursive = true;
    };

    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

  programs.zsh ={
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


  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ptc/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
