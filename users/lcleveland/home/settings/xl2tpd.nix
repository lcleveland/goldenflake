{ lib, config, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    services.xl2tpd.enable = true;
  };
}
