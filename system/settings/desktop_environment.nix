{ lib, config, ... }:
let
  cfg = config.system.settings.desktop_environment;
in
{
  imports = [
    ./desktop_environments
  ];
  options.system.settings.desktop_environment = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc ''
        Enable desktop environment;
      '';
    };
    environment = lib.mkOption {
      type = lib.types.str;
      default = "gnome";
      description = lib.mdDoc ''
        Environment to use;
      '';
    };
  };
  config = lib.mkIf cfg.enable {
    system.settings.desktop_environments.${cfg.environment}.enable = true;
  };
}
