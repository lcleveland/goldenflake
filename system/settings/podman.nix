{ lib, config, ... }:
let
  cfg = config.system.settings.podman;
in
{
  options.system.settings.podman = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = lib.mdDoc "Enable podman";
    };
  };
  config = lib.mkIf cfg.enable {
    virtualisation = {
      podman = {
        enable = cfg.enable;
        dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true;
      };
    };
  };
}
