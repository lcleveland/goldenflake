{ settings, pkgs, ... }: {
  home-manager.users.${settings.username}.home.packages = with pkgs; [ openssl ];
}