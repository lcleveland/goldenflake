{ lib, config, ... }:
let
  cfg = config.system.settings.fingerprint;
in
{
  options.system.settings.fingerprint = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = lib.mdDoc "Enable fingerprinting";
    };
  };
  config = lib.mkIf cfg.enable {
    services.fprintd.enable = cfg.enable;
  };
}
