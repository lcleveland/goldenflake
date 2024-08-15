{ lib, config, ... }:
let
  cfg = config.system.settings.graphics;
in
{
  options.system.settings.graphics = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable the graphics subsystem.";
    };
    vendor = lib.mkOption {
      type = lib.types.str;
      default = "nvidia";
      description = lib.mdDoc "The graphics vendor.";
    };
  };
  config = lib.mkIf cfg.enable {
    system.settings.graphics.${cfg.vendor}.enable = true;
  };
}
