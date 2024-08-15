{ lib, config, ... }:
let
  cfg = config.system.settings.cpus.intel;
in
{
  options.system.settings.cpus.intel = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc ''
        Enable Intel microcode update
      '';
    };
  };
  config = lib.mkIf cfg.enable {
    hardware.cpu.intel.updateMicrocode = cfg.enable;
  };
}
