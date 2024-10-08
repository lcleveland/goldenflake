{ lib, config, ... }:
let
  cfg = config.system.settings.networking;
in
{
  options.system.settings.networking = {
    hostname = lib.mkOption {
      type = lib.types.str;
      default = "nixos";
      description = lib.mdDoc ''
        Hostname
      '';
    };
  };
  config = {
    networking = {
      hostName = cfg.hostname;
      networkmanager.enable = true;
    };
  };
}
