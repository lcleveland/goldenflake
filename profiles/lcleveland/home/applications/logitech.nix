{ pkgs, settings, ... }: {
  home-manager.users.${settings.username}.home.packages = with pkgs; [ logitech-udev-rules ];
}