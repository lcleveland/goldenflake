{ lib, config, ... }:
let
  cfg = config.system.settings.boot_loader;
in
{
  options.system.settings.boot_loader = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc ''
                Enable boot loader
        	     '';
    };
    systemd-boot.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc ''
        Enable systemd-boot
      '';
    };
    efi.canTouchEfiVariables = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc ''
        Enable EFI boot
      '';
    };
  };
  config = lib.mkIf cfg.enable {
    boot.loader = {
      systemd-boot.enable = cfg.systemd-boot.enable;
      efi.canTouchEfiVariables = cfg.efi.canTouchEfiVariables;
    };
  };
}
