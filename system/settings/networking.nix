{ settings, ... }: {
  networking = {
    hostName = settings.hostname;
    networkmanager.enable = true;
  };
}
