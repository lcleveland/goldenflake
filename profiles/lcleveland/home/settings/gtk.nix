{ settings, ... }: {
  home-manager.users.${settings.username}.gtk = {
    enable = true;
    theme.name = settings.gtk_theme;
  };
}
