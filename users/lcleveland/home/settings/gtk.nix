{ settings, pkgs, config, ... }: {
  home-manager.users.${config.users.lcleveland.username}.gtk = {
    enable = true;
    theme = {
      name = settings.gtk_theme;
      package = pkgs.gnome-themes-extra;
    };
  };
}
