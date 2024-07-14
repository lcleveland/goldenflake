{ settings, ... }: {

  home-manager.users.${settings.username}.tmux = {
    enable = true;
  };
}
