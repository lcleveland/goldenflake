{ ... }: {
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./flatpak.nix
    ./allow_unfree.nix
    ./boot_loader.nix
    ./desktop_environment.nix
    ./display_manager.nix
    ./keymap.nix
    ./enable_flakes.nix
    ./state_version.nix
    ./locale.nix
    ./networking.nix
    ./printing.nix
    ./sound.nix
    ./time.nix
    ./nvidia.nix
    ./git.nix
  ];
}
