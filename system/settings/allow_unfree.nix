{ lib, config, ... }:
let
  cfg = config.system.settings.allow_unfree;
in
{
  options.system.settings.allow_unfree = {
    enable = lib.mkOption
      {
        type = lib.types.bool;
        default = true;
        description = lib.mdDoc ''
          Enable unfree software
        '';
      };
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = cfg.enable;
  };
}
