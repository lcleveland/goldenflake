{ settings, ... }: {
  home-manager.users.${settings.username}.programs.kitty = {
    shellIntegration.enableZshIntegration = true;
  };
}
