{ lib, pkgs, config, ... }:
let
  cfg = config.users.lcleveland;
in
{
  options.users.lcleveland = {
    gtk_theme = lib.mkOption {
      default = "Adwaita-dark";
      description = lib.mdDoc "The Gtk theme to use";
      type = lib.types.str;
    };
  };
  config = lib.mkIf config.users.lcleveland.enable {
    home-manager.users.${config.users.lcleveland.username}.gtk = {
      enable = true;
      theme = {
        name = cfg.gtk_theme;
        package = pkgs.gnome-themes-extra;
      };
    };
  };
}
