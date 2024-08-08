{ pkgs, settings, ... }: {
  home-manager.users.${settings.username}.home.packages = with pkgs; [
    ghidra
    ghidra-extensions.machinelearning
    ghidra-extensions.gnudisassembler
    ghidra-extensions.ghidraninja-ghidra-scripts
  ];
}
