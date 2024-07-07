{ settings, ... }: {
  services.xserver.xkb = {
    layout = settings.keyboard.layout;
    variant = settings.keyboard.variant;
  };
}
