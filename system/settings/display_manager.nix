{ lib, config, ... }:
let
  cfg = config.system.settings.display_manager;
in
{
  imports = [
    ./display_managers
  ];
  options.system.settings.display_manager = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = lib.mdDoc ''
        Enable display manager'';
    };
    display_manager = lib.mkOption {
      type = lib.types.str;
      default = "gdm";
      description = lib.mdDoc ''
                Display manager to use
        	'';
    };
  };
  config = lib.mkIf cfg.enable {
    system.settings.display_managers.${cfg.display_manager}.enable = true;
  };
}
