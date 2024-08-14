{ lib, config, ... }:
with lib;
let
  cfg = config.system.settings.amd;
in
{
  options.system.settings.amd = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = mdDoc ''
        Enable AMD microcode update
      '';
    };
  };
  config = mkIf cfg.enable {
    hardware.cpu.amd.updateMicrocode = cfg.enable;
  };
}
