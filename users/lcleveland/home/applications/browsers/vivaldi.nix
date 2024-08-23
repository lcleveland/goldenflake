{ pkgs, config, lib, ... }:
let
  cfg = config.users.lcleveland.home.applications.browsers.vivaldi;
in
{
  options.users.lcleveland.home.applications.browsers.vivaldi = {
    enable = lib.mkOption {
      default = false;
      description = lib.mdDoc "Enable the Vivaldi browser";
      type = lib.types.bool;
    };
  };
  config = lib.mkIf cfg.enable {
    home-manager.users.${config.users.lcleveland.username}.home.packages = with pkgs; [
      vivaldi
      vivaldi-ffmpeg-codecs
    ];
  };
}
