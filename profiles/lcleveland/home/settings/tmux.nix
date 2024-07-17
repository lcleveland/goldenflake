{ settings, ... }: {

  home-manager.users.${settings.username}.programs.tmux = {
    enable = true;
    extraConfig = ''
      set-window-option -g mode-keys vi
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
    '';
  };
}
