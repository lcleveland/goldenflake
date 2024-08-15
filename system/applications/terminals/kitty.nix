{ pkgs, lib, config, ... }:
let
  cfg = config.system.applications.terminal.kitty;
in
{
  options.system.applications.terminal.kitty = {
    enable = lib.mkOption {
      type = lib.types.bool;
      description = lib.mdDoc "Enable the kitty terminal";
      default = false;
    };
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      kitty
    ];
  };
}
