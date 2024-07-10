{ ... }: {
  services.strongswan = {
    enable = true;
    secrets = [
      "/etc/ipsec.d/ipsec.nm-l2tp.secrets"
    ];
  };
}
