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
      description = lib.jdDoc ''
        Enable display manager'';
    };
  };
  config = lib.mkIf cfg.enable {
    system.settings.display_managers.${cfg.display_manager}.enable = true;
  };
}
