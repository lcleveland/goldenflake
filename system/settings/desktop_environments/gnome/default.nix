{ pkgs, lib, config, ... }:
let
  cfg = config.system.settings.desktop_environments.gnome;
in
{
  options.system.settings.desktop_environments.gnome = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = lib.mdDoc ''
        Enable desktop environment
      '';
    };
  };
  config = lib.mkIf cfg.enable {
    services = {
      xserver = {
        excludePackages = with pkgs; [
          xterm
        ];
        desktopManager = {
          gnome = {
            enable = true;
          };
          xterm.enable = false;
        };
      };
      udev.packages = with pkgs; [ gnome-settings-daemon ];
    };
    environment.gnome.excludePackages = (with pkgs; [
      gnome-tour
      gnome-terminal
      gnome-console
      gnome-connections
      gnome-text-editor
      gnome-characters
      gnome-music
      gedit
      epiphany
      geary
      evince
      totem
    ]) ++ (with pkgs.gnome; [
    ]);
    nixpkgs.overlays = [
      (final: prev: {
        gnome = prev.gnome.overrideScope (gnomeFinal: gnomePrev: {
          mutter = gnomePrev.mutter.overrideAttrs (old: {
            src = pkgs.fetchFromGitLab {
              domain = "gitlab.gnome.org";
              owner = "vanvugt";
              repo = "mutter";
              rev = "triple-buffering-v4-46";
              hash = "sha256-C2VfW3ThPEZ37YkX7ejlyumLnWa9oij333d5c4yfZxc=";
            };
          });
        });
      })
    ];
    nixpkgs.config.allowAliases = false;
  };
}
