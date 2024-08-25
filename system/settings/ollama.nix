{ lib, config, ... }:
let
  cfg = config.system.settings.ollama;
in
{
  options.system.settings.ollama = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable Ollama";
    };
    acceleration = lib.mkOption {
      type = lib.types.str;
      default = null;
      description = lib.mdDoc "Acceleration method";
    };
  };
  config = lib.mkIf cfg.enable {
    services.ollama = {
      enable = cfg.enable;
      acceleration = cfg.acceleration;
      host = "0.0.0.0";
    };
  };
}
