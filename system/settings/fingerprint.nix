{ settings, ... }: {
  services.fprintd.enable = settings.enable_fingerprint;
}
