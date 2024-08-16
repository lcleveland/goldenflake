{ lib, config, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    networking.search = [
      "lselectric.local"
    ];
    networking.resolvconf.dnsExtensionMechanism = false;
  };
}
