{ lib, config, ... }:
let
  cfg = config.system.settings.git;
in
{
  options.system.settings.git = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable git support";
    };
  };
  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = cfg.enable;
      config = {
        credential.helper = "oauth";
      };
    };
  };
}
