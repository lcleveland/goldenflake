{ lib, config, pkgs, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    home-manager.users.${config.users.lcleveland.username}.home.packages = with pkgs.gnomeExtensions; [ gsnap ];
  };
}
