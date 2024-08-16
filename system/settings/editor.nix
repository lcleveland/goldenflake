{ lib, config, ... }:
let
  cfg = config.system.settings.editor;
in
{
  options.system.settings.editor = {
    default = lib.mkOption {
      type = lib.types.str;
      description = lib.mdDoc "The default editor to use";
      default = "neovim";
    };
  };
  config = {
    system.applications.${cfg.default}.enable = true;
  };
}
