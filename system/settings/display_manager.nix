{ settings, ... }: {
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = settings.wayland;
    };
  };
}
