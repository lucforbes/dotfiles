# remap prefix from 'C-b' to 'C-a'
set-option -g prefix C-a

# vim keys for navigation
bind-key k select-pane -U
bind-key j select-pane -D
bind-key h select-pane -L
bind-key l select-pane -R

# resize windows with vim keys
bind-key -r C-h resize-pane -L
bind-key -r C-j resize-pane -D
bind-key -r C-k resize-pane -U
bind-key -r C-l resize-pane -R

# split panes using | and -
bind | split-window -h
bind - split-window -v
unbind '"'
unbind %

# enable mouse
set-option -g mouse on

# reload config file with r
bind r source-file ~/.tmux.conf

# fix weird default behaviour (https://unix.stackexchange.com/a/669491)
bind-key Up select-pane -U
bind-key Down select-pane -D
bind-key Left select-pane -L
bind-key Right select-pane -R
