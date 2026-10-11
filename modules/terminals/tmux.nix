{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    tmux 
  ];

  programs.tmux = {
    enable = true;
    shortcut = "a";
    baseIndex = 1;
    escapeTime = 25;
    historyLimit = 5000;
    keyMode = "vi";
    mouse = true;
    terminal = "screen-256color";
    
    plugins = with pkgs.tmuxPlugins; [
      sensible
      resurrect
    ];
  
    extraConfig = ''
      set-option -ga terminal-overrides ",xterm-256color:Tc"
  
      # status line
      set -g status-position bottom 
      set -g status-bg "#080808"
      set -g status-fg "#B8B8B8"
      set -g status-left '#{session_name} - '
      set -g status-right ""
      set -g status-right-length 50
      set -g status-left-length 20 
      setw -g window-status-current-format ' #I#[fg=#777777]:#[fg=#FFFFFF]#W#[fg=#B8B8B8]#F '
      setw -g window-status-format ' #I#[fg=#404040]:#[fg=#777777]#W#[fg=#404040]#F '
  
      # vim movement
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
  
      # Open new pane in same directory
      bind c new-window -c "#{pane_current_path}"
      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
  
      # Wayland copy tweaks
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'wl-copy'
    '';
  };
}
