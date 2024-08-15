{ config, lib, ... }:
let
  cfg = config.system.settings.graphics.nvidia;
in
{
  options.system.settings.graphics.nvidia = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = lib.mdDoc "Enable nvidia support.";
    };
    driver = lib.mkOption {
      type = lib.types.str;
      default = "beta";
      description = lib.mdDoc "The nvidia driver to use.";
    };
  };
  config = lib.mkIf cfg.enable {
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware = {
      graphics.enable = true;
      nvidia = {
        modesetting.enable = true;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.${cfg.driver};
        powerManagement = {
          enable = false;
          finegrained = false;
        };
      };
    };
  };
}
