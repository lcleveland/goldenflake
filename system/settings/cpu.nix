{ lib, config, ... }:
let
  cfg = config.system.settings.cpu;
in
{
  imports = [
    ./cpus
  ];
  options.system.settings.cpu = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc ''
        Enable cpu microcode update
      '';
    };
    vendor = lib.mkOption {
      type = lib.types.str;
      default = "amd";
      description = lib.mdDoc ''
                CPU vendor
        	   '';
    };
  };
  config = lib.mkIf cfg.enable {
    hardware.cpu.${cfg.vendor}.updateMicrocode = cfg.enable;
  };
}
