{ lib, config, ... }:
let
  cfg = config.system.settings.qt;
in
{
  options.system.settings.qt = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable QT";
    };
    style = lib.mkOption {
      type = lib.types.str;
      default = "adwaita-dark";
      description = "QT style";
    };
  };
  config = lib.mkIf cfg.enable {
    qt.style = cfg.style;
  };
}
