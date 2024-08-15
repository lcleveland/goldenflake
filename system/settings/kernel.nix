{ pkgs, lib, config, ... }:
let
  cfg = config.system.settings.kernel;
in
{
  options.system.settings.kernel = {
    kernel_pkg = lib.mkOption {
      type = lib.types.attrs;
      default = pkgs.linuxPackages_latest;
      description = "The kernel package to use";
    };
  };
  config = {
    boot.kernelPackages = cfg.kernel_pkg;
  };
}
