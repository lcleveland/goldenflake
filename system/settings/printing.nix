{ settings, ... }: {
  services.printing.enable = settings.printing_support;
}
