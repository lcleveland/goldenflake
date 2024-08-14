{ lib, config, ... }:
with lib;
let
  cfg = config.system.settings.appimage;
in
{
  options.system.settings.appimage = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = mdDoc ''
        Enable AppImage support
      '';
    };
    binfmt = mkOption {
      type = types.bool;
      default = true;
      description = mdDoc ''
        Enable AppImage binfmt
      '';
    };
  };
  config = mkIf cfg.enable {
    programs.appimage = {
      enable = cfg.enable;
      binfmt = cfg.binfmt;
    };
  };
}
