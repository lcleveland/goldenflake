{ lib, config, ... }:
let
  cfg = config.system.settings.cpus.amd;
in
{
  options.system.settings.cpus.amd = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc ''
        Enable AMD microcode update
      '';
    };
  };
  config = lib.mkIf cfg.enable {
    hardware.cpu.amd.updateMicrocode = cfg.enable;
  };
}
