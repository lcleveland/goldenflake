{ lib, config, ... }:
let
  cfg = config.system.settings.graphic;
in
{
  imports = [
    ./graphics
  ];
  options.system.settings.graphic = {
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
