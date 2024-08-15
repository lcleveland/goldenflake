{ lib, config, ... }:
let
  cfg = config.system.settings.keymap;
in
{
  options.system.settings.keymap = {
    layout = lib.mkOption {
      type = lib.types.str;
      default = "us";
      description = "The keyboard layout to use";
    };
    variant = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "The keyboard variant to use";
    };
  };
  config = {
    services.xserver.xkb = {
      layout = cfg.layout;
      variant = cfg.variant;
    };
  };
}
