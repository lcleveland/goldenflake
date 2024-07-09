{ settings, ... }: {
  home-manager.users.${settings.username}.programs.neovim = {
    withNodeJs = true;
  };
}
