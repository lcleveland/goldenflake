{ settings, ... }: {
  home-manager.users.${settings.username}.gtk = {
    enable = true;
    theme = settings.gtk_theme;
  };
}
