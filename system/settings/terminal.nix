{ lib, config, ... }:
let
  cfg = config.system.settings.terminal;
in
{
  imports = [
    ../applications/shells
    ../applications/terminals
  ];
  options.system.settings.terminal = {
    enable = lib.mkOption {
      type = lib.types.bool;
      description = lib.mdDoc "Enable the terminal";
      default = true;
    };
    shell = lib.mkOption {
      type = lib.types.str;
      description = lib.mdDoc "The shell to use";
      default = "zsh";
    };
    emulator = lib.mkOption {
      type = lib.types.str;
      description = lib.mdDoc "The emulator to use";
      default = "kitty";
    };
  };
  config = lib.mkIf cfg.enable {
    system.applications = {
      shells.${cfg.shell}.enable = true;
      terminals.${cfg.emulator}.enable = true;
    };
    xdg.terminal-exec = {
      enable = true;
      settings = {
        default = [
          "kitty.desktop"
        ];
      };
    };
  };
}
