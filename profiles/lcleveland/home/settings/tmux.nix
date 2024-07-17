{ settings, ... }: {

  home-manager.users.${settings.username}.programs.tmux = {
    enable = true;
    extraConfig = ''
      set-window-option -g mode-keys vi
    '';
  };
}
