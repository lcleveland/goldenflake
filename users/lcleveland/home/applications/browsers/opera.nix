{ pkgs, config, lib, ... }:
let
  cfg = config.users.lcleveland.home.applications.browsers.opera;
in
{
  options.users.lcleveland.home.applications.browsers.opera = {
    enable = lib.mkOption {
      default = false;
      description = lib.mdDoc "Enable opera browser";
      type = lib.types.bool;
    };
  };
  config = lib.mkIf cfg.enable {
    home-manager.users.${config.users.lcleveland.username}.home.packages = with pkgs; [
      opera
    ];
  };
}
