{ lib, config, ... }:
let
  cfg = config.system.settings.nh;
in
{
  options.system.settings.nh = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable the NH program.";
    };
    flake_location = lib.mkOption {
      type = lib.types.path;
      default = "/home";
      description = lib.mdDoc "Path to the nix flake.";
    };
  };
  config = lib.mkIf cfg.enable {
    programs.nh = {
      enable = cfg.enable;
      flake = cfg.flake_location;
    };
  };
}
