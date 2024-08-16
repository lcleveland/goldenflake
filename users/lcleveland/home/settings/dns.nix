{ ... }: {
  networking.search = [
    "lselectric.local"
  ];
  networking.resolvconf.dnsExtensionMechanism = false;
}
