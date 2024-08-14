{ lib, config, ... }:
with lib;
let
  cfg = config.system.applications.settings.allow_unfree;
in
{
  options.system.settings.applications.settings.allow_unfree = {
    enable = mkOption
      {
        type = types.bool;
        default = true;
      };
  };

  config = mkIf cfg.enable {
    allowUnfree = cfg.enable;
  };
}
