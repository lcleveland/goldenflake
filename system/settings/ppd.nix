{ lib, config, ... }:
let
  cfg = config.system.settings.ppd;
in
{
  options.system.settings.ppd = {
    enable = lib.mkOption {
      type = lib.types.bool;
      description = "Enable PPD";
      default = true;
    };
  };
  config = lib.mkIf cfg.enable {
    services.power-profiles-daemon.enable = cfg.enable;
  };
}
