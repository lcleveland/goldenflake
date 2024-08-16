{ ... }: {
  system.settings = {
    locale = "en_US.UTF-8";
    display_manager = {
      enable = true;
      display_manager = "gdm";
    };
    graphic.enable = true;
    cpu.vendor = "amd";
    networking.hostname = "DREAM";
    fingerprint.enable = false;
    time.timezone = "America/Chicago";
    keymap = {
      layout = "us";
      variant = "";
    };
  };
  users.settings = {
    lcleveland = {
      enable = true;
    };
  };
}
