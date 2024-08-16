{ lib, config, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    hardware.flipperzero.enable = true;
  };
}
