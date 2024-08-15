{ settings, lib, config, ... }:
let
  cfg = config.system.settings.display_managers.gdm;
in
{
  options.system.settings.display_managers.gdm = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = lib.mdDoc "Enable GDM";
    };
  };
  config = lib.mkIf cfg.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = settings.wayland;
      };
    };
  };
}
