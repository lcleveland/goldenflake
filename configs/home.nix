{ ... }: {
  system.settings = {
    locale = "en_US.UTF-8";
    cpu.vendor = "amd";
    networking.hostname = "DREAM";
    fingerprint.enable = false;
    time.timezone = "America/Chicago";
    keymap = {
      layout = "us";
      variant = "";
    };
  };
}
