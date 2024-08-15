{ lib, config, ... }:
let
  cfg = config.system.settings.appimage;
in
{
  options.system.settings.appimage = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc ''
        Enable AppImage support
      '';
    };
    binfmt = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc ''
        Enable AppImage binfmt
      '';
    };
  };
  config = lib.mkIf cfg.enable {
    programs.appimage = {
      enable = cfg.enable;
      binfmt = cfg.binfmt;
    };
  };
}
