{ settings, pkgs, ... }: {
  home-manager.users.${settings.username}.gtk = {
    enable = true;
    theme = {
      name = settings.gtk_theme;
      package = pkgs.gnome-themes-extra;
    };
  };
}
