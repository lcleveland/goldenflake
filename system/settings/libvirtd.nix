{ pkgs, lib, config, ... }:
let
  cfg = config.system.settings.libvirtd;
in
{
  options.system.settings.libvirtd = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = lib.mdDoc "Enable libvirtd";
    };
  };
  config = lib.mkIf cfg.enable {
    virtualisation.libvirtd = {
      enable = cfg.enable;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            }).fd
          ];
        };
      };
    };
    boot.extraModprobeConfig = "options kvm_intel nested=1";
  };
}
