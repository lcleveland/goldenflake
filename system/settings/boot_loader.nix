{ lib, config, ... }:
with lib;
let
  cfg = config.system.settings.boot_loader;
in
{
  options.system.settings.boot_loader = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = mdDoc ''
                Enable boot loader
        	     '';
    };
    systemd-boot.enable = mkOption {
      type = types.bool;
      default = true;
      description = mdDoc ''
        Enable systemd-boot
      '';
    };
    efi.canTouchEfiVariables = mkOption {
      type = types.bool;
      default = true;
      description = mdDoc ''
        Enable EFI boot
      '';
    };
  };
  config = mkIf cfg.enable {
    boot.loader = {
      systemd-boot.enable = cfg.systemd-boot.enable;
      efi.canTouchEfiVariables = cfg.efi.canTouchEfiVariables;
    };
  };
}
