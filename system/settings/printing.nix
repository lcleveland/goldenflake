{ lib, config, ... }:
let
  cfg = config.system.settings.printing;
in
{
  options.system.settings.printing = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable printing support.";
    };
  };
  config = lib.mkIf cfg.enable {
    services.printing.enable = cfg.enable;
  };
}
