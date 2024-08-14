{ lib, config, ... }:
with lib;
let
  cfg = config.system.settings.allow_unfree;
in
{
  options.system.settings.allow_unfree = {
    enable = mkOption
      {
        type = types.bool;
        default = true;
        description = mdDoc ''
          Enable unfree software
        '';
      };
  };

  config = mkIf cfg.enable {
    nixpkgs.config.allowUnfree = cfg.enable;
  };
}
