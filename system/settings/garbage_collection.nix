{ lib, config, ... }:
let
  cfg = config.system.settings.garbage_collection;
in
{
  options.system.settings.garbage_collection = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable garbage collection";
    };
    automatic = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable automatic garbage collection";
    };
    options = lib.mkOption {
      type = lib.types.str;
      default = "--delete-older-than 7d";
      description = lib.mdDoc "Garbage collection options";
    };
    dates = lib.mkOption {
      type = lib.types.str;
      default = "weekly";
      description = lib.mdDoc "Garbage collection dates";
    };
  };
  config = lib.mkIf cfg.enable {
    nix.gc = {
      automatic = cfg.automatic;
      dates = cfg.dates;
      options = cfg.options;
    };
  };
}
