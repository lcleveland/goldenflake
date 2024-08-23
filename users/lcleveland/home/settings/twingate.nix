{ lib, config, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    services.twingate.enable = true;
  };
}
