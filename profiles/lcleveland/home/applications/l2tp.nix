{ pkgs, settings, ... }: {
  home-manager.users.${settings.username}.home.packages = with pkgs; [ gnome.networkmanager-l2tp ];
}
