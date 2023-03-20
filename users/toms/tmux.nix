{ config, lib, pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    extraConfig = ''
set -g status-bg colour234
set -g status-fg white

# alignment settings
set-option -g status-justify centre

# status left options
set-option -g status-left '#[fg=green][#[bg=colour234,fg=cyan]#S#[fg=green]]'
set-option -g status-left-length 20

# window list options
setw -g automatic-rename on
set-window-option -g window-status-format '#[fg=cyan,dim]#I#[fg=blue]:#[default]#W#[fg=grey,dim]#F'
set-window-option -g window-status-current-format '#[bg=colour234,fg=cyan,bold]#I#[bg=colour234,fg=cyan]:#[fg=colour230]#W#[fg=dim]#F'
set -g base-index 1

# status right options
set -g status-right '#[fg=green][#[fg=blue]%Y-%m-%d #[fg=white]%H:%M#[default]#[fg=green]]'

set -g status off

set -g default-terminal screen-256color

setw -g automatic-rename on

set -s escape-time 0

bind R source-file ~/.tmux.conf \; display-message "  Config reloaded..".
#set -g mouse on

# buffer
bind Space choose-buffer
    '';
  };
}
