{ settings, pkgs, ... }: {

  home-manager.users.${settings.username}.programs.tmux = {
    enable = true;
    extraConfig = ''
      set-option -g default-shell ${pkgs.${settings.default_shell}}/bin/${settings.default_shell}
      set-window-option -g mode-keys vi
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
    '';
  };
}
