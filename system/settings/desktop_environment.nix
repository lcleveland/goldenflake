{ lib, config, ... }:
with lib;
let
  cfg = config.system.settings.desktop_environment;
in
{
  options.system.settings.desktop_environment = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = lib.mdDoc ''
        Enable desktop environment;
      '';
    };
    environment = {
      type = types.str;
      default = "gnome";
      description = lib.mdDoc ''
        Environment to use;
      '';
    };
  };
  config = mkIf cfg.enable {
    config.system.settings.desktop_environment.${cfg.environment}.enable = true;
  };
}
