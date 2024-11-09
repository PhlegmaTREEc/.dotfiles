{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    prefix = "C-j";
    keyMode = "vi";
    mouse = true;
    clock24 = true;
    extraConfig = ''
      # Initial setup
      set -g default-terminal xterm-256color
      
      # Lengthen the amount of time status messages are displayed
      set-option -g display-time 3000
      set-option -g display-panes-time 3000
      
      # Set the base-index to 1 rather than 0
      set -g base-index 1
      set-window-option -g pane-base-index 1

      # Automatically set window title
      set-window-option -g automatic-rename on
      set-option -g set-titles on

      # Cattppucin
      set -g @catppuccin_flavor "mocha"
      set -g @catppuccin_window_status_style "rounded"

      set -g status-right-length 100
      set -g status-left-length 100
      set -g status-left ""
      set -g status-right "#{E:@catppuccin_status_application}"
      set -ag status-right "#{E:@catppuccin_status_session}"
      set -ag status-right "#{E:@catppuccin_status_uptime}"

      # Load catppuccin
      run ~/.dotfiles/home/catppuccin-tmux/catppuccin.tmux
      
      # Use Alt-arrow keys without prefix key to switch panes
      bind -n M-h select-pane -L
      bind -n M-l select-pane -R
      bind -n M-k select-pane -U
      bind -n M-j select-pane -D
      
      # Set easier window split keys
      bind-key v split-window -h
      bind-key h split-window -v

      # Set easier switch windows
      bind -n M-p previous-window
      bind -n M-n next-window

      bind-key j swap-window -t -1
      bind-key k swap-window -t +1

      # Easy config reload
      bind-key r source-file ~/.config/tmux/tmux.conf \; display-message "tmux.conf reloaded."
    '';
  };
}
