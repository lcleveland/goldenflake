{ config, lib, pkgs, ... }:
let
  cfg = config.system.applications.neovim;
in
{
  options.system.applications.neovim = {
    enable = lib.mkOption {
      type = lib.types.bool;
      description = lib.mdDoc "Enable neovim";
    };
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.neovim
    ];
  };
}
