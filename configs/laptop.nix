{ ... }: {
  system.settings = {
    locale = "en_US.UTF-8";
    display_manager = {
      enable = true;
      display_manager = "gdm";
    };
    cpu.vendor = "amd";
    networking.hostname = "LS-04380";
    fingerprint.enable = true;
    time.timezone = "America/Chicago";
    keymap = {
      layout = "us";
      variant = "colemak_dh";
    };
    nh.flake_location = "/home/lcleveland/Flakes/goldenflake";
  };
  users = {
    lcleveland = {
      enable = true;
    };
  };
}
