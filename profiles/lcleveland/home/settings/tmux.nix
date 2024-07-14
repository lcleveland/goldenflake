{ settings, ... }: {

  home-manager.users.${settings.username}.programs.tmux = {
    enable = true;
  };
}
