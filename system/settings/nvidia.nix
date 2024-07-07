{ config, lib, settings, ... }: {
  config = lib.mkIf settings.nvidia {
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware = {
      graphics.enable = true;
      nvidia = {
        modesetting.enable = true;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.${settings.nvidia_driver};
        powerManagement = {
          enable = false;
          finegrained = false;
        };
      };
    };
  };
}
