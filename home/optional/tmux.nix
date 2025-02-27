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

      # Allow the arrow key to be used immediately after changing windows.
      set-option -g repeat-time 0

      # No delay for escape key press
      set -sg escape-time 0

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
      
      ## Use Alt-arrow keys without prefix key to switch panes
      #bind -n M-h select-pane -L
      #bind -n M-l select-pane -R
      #bind -n M-k select-pane -U
      #bind -n M-j select-pane -D
      
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

      # Smart pane switching with awareness of Vim splits.
      # See: https://github.com/christoomey/vim-tmux-navigator
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
      bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
      bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
      bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
      bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
      tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
      if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
          "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
      if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
          "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"
      
      bind-key -T copy-mode-vi 'C-h' select-pane -L
      bind-key -T copy-mode-vi 'C-j' select-pane -D
      bind-key -T copy-mode-vi 'C-k' select-pane -U
      bind-key -T copy-mode-vi 'C-l' select-pane -R
      bind-key -T copy-mode-vi 'C-\' select-pane -l
    '';
  };
}
