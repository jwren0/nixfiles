{
    enable = true;
    baseIndex = 1;
    escapeTime = 0;
    keyMode = "vi";
    mouse = true;
    newSession = true;
    prefix = "C-Space";
    terminal = "xterm-256color";
    extraConfig = ''
bind-key -n S-Left select-pane -L
bind-key -n S-Down select-pane -D
bind-key -n S-Up select-pane -U
bind-key -n S-Right select-pane -R

bind-key h split-window -v -c "#{pane_current_path}"
bind-key v split-window -h -c "#{pane_current_path}"
bind-key -n M-Left previous-window
bind-key -n M-Right next-window

bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

set-option -sa terminal-overrides ",xterm-256color:Tc"

# One Dark
%hidden OD_BLACK="#282c34"
%hidden OD_RED="#e06c75"
%hidden OD_GREEN="#98c379"
%hidden OD_YELLOW="#e5c07b"
%hidden OD_BLUE="#61afef"
%hidden OD_MAGENTA="#c678dd"
%hidden OD_CYAN="#56b6c2"
%hidden OD_WHITE="#aab2bf"
%hidden OD_GREY="#3e4452"

set-option -g status-bg "$OD_BLACK"
set-option -g status-fg "$OD_WHITE"

set-option -g status-left \
"#[fg=$OD_WHITE,bg=$OD_GREY,nounderscore,noitalics] #{version} \
#[fg=$OD_GREY,bg=$OD_BLACK] #{session_windows} "

set-option -g window-status-format \
"#[fg=$OD_WHITE,bg=$OD_BLACK,nounderscore,noitalics]\
#{window_index} ⮁#[fg=$OD_GREY] #{pane_current_command}\
#[fg=$OD_BLACK,bg=$OD_BLACK]"

set-option -g window-status-current-format \
"#[fg=$OD_BLACK,bg=$OD_BLUE,nounderscore,noitalics]\
 #{window_index} ⮁#[bold] #{pane_current_command} \
#[fg=$OD_BLUE,bg=$OD_BLACK]"

set-option -g status-right \
"#[fg=$OD_YELLOW,bg=$OD_BLACK,nounderscore,noitalics,bold]\
#[fg=$OD_BLACK,bg=$OD_YELLOW,nobold] %H:%M \
#[fg=$OD_MAGENTA,bg=$OD_YELLOW]\
#[fg=$OD_BLACK,bg=$OD_MAGENTA] %Y-%m-%d \
#[fg=$OD_GREEN,bg=$OD_MAGENTA]\
#[fg=$OD_BLACK,bg=$OD_GREEN] #{user}@#h "
    '';
}
