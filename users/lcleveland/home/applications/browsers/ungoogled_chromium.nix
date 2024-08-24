{ pkgs, config, lib, ... }:
let
  cfg = config.users.lcleveland.home.applications.browsers.ungoogled_chromium;
in
{
  options.users.lcleveland.home.applications.browsers.ungoogled_chromium = {
    enable = lib.mkOption {
      default = true;
      description = lib.mdDoc "Enable the un-googled Chromium browser";
      type = lib.types.bool;
    };
  };
  config = lib.mkIf cfg.enable {
    home-manager.users.${config.users.lcleveland.username}.home.packages = with pkgs; [
      ungoogled-chromium
    ];
  };
}
