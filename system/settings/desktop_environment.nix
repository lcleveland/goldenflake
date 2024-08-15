{ lib, config, ... }:
with lib;
let
  cfg = config.system.settings.desktop_environment;
in
{
  imports = [
    ./desktop_environments/gnome
  ];
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
    config.system.settings.desktop_environments.${cfg.environment}.enable = true;
  };
}
