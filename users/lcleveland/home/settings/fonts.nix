{ lib, config, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    home-manager.users.${config.users.lcleveland.username}.fonts = {
      fontconfig.enable = true;
    };
  };
}
