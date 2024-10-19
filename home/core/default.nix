{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    bat bat-extras.prettybat bat-extras.batwatch bat-extras.batpipe bat-extras.batman bat-extras.batgrep bat-extras.batdiff
    bottom
    cliphist
    duf
    du-dust
    dig
    fastfetch
    fd
    gcc
    git
    jq
    lazygit
    lsd
    neovim
    navi
    p7zip
    ripgrep
    rclone
    starship
    trash-cli
    tree
    tree-sitter
    unzip
    upower
    unar
    wget
    wl-clipboard
    xclip
    xdg-utils
    yazi
  ];

  home.file = {
    ".config/lazygit" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/lazygit";
      }; 
    ".config/navi" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/navi";
      }; 
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/nvim";
      }; 
    ".config/starship" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/starship";
      }; 
    ".config/yazi" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/yazi";
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

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  
  #programs.nixvim = {
  #  enable = true;
  #  colorschemes.dracula.enable = true;
  #  plugins.lualine.enable = true;
  #};

  # Session variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
