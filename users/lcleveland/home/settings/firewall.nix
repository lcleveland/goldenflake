{ lib, config, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    networking.firewall.enable = false;
  };
}
