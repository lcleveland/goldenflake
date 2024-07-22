{ settings, ... }: {
  home-manager.users.${settings.username}.gtk = {
    theme = settings.gtk_theme;
  };
}
