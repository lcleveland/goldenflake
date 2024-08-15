{ pkgs, lib, config, ... }:
let
  cfg = config.system.settings.flatpak;
in
{
  options.system.settings.flatpak = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = lib.mdDoc "Enable Flatpak";
    };
    repo_hash = lib.mkOption {
      type = lib.types.str;
      default = "sha256-M3HdJQ5h2eFjNjAHP+/aFTzUQm9y9K+gwzc64uj+oDo=";
      description = lib.mdDoc "Flatpak repo hash";
    };
    repo_url = lib.mkOption {
      type = lib.types.str;
      default = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      description = lib.mdDoc "Flatpak repo url";
    };
  };
  config = lib.mkIf cfg.enable {
    services.flatpak.enable = cfg.enable;
    environment.etc = {
      "flatpak/remotes.d/flathub.flatpakrepo".source = pkgs.fetchurl {
        url = cfg.repo_url;
        hash = cfg.repo_hash;
      };
    };
  };
}
