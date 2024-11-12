# don't rename windows automatically
#set-option -g allow-rename off

# customize status bar
#set-option -g status-bg black
#set-option -g status-fg blue

# status bar windows
#set-option -g window-status-style "bg=black,fg=blue"
#set-option -g window-status-current-style "bg=blue,fg=black,bold"

# disable status indicator characters
#set-option -g window-status-current-format " #{pane_current_command} "
#set-option -g window-status-format " #{pane_current_command} "
#set-option -g window-status-separator ""

# customize status left
#set-option -g status-left ""

# clear status right
#set-option -g status-right " [#S]"

# status bar position
#set-option -g status-position bottom

# customize pane borders
#set-option -g pane-border-style fg=black
#set-option -g pane-active-border-style fg=blue
set-option -g pane-border-lines heavy # doesn't work on os161

# fix prompt colour
#set-option default-terminal "screen-256color"
