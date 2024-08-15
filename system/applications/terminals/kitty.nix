{ pkgs, lib, config, ... }:
let
  cfg = config.applications.terminal.kitty;
in
{
  options.applications.terminal.kitty = {
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
