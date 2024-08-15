{ pkgs, lib, config, ... }:
let
  cfg = config.system.applications.terminals.ptyxis;
in
{
  options.system.applications.terminals.ptyxis = {
    enable = lib.mkOption {
      type = lib.types.bool;
      description = lib.mdDoc "Enable the ptyxis terminal";
      default = false;
    };
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.ptyxis
    ];
  };
}
