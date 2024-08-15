{ pkgs, lib, config, ... }:
let
  cfg = config.applications.shells.zsh;
in
{
  options.applications.shells.zsh = {
    enable = lib.mkOption {
      type = lib.types.bool;
      description = lib.mdDoc "Enable the zsh shell";
      default = false;
    };
  };
  config = lib.mkIf cfg.enable {
    programs.zsh.enable = true;
    environment.systemPackages = [
      pkgs.zsh
    ];
  };
}
