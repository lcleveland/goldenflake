{ lib, config, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    services.strongswan = {
      enable = true;
      secrets = [
        "ipsec.d/ipsec.nm-l2tp.secrets"
      ];
    };
  };
}
