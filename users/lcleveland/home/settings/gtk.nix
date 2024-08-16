{ lib, settings, pkgs, config, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    home-manager.users.${config.users.lcleveland.username}.gtk = {
      enable = true;
      theme = {
        name = settings.gtk_theme;
        package = pkgs.gnome-themes-extra;
      };
    };
  };
}
