{ pkgs, config, ... }: {
  home-manager.users.${config.users.lcleveland.username}.home.packages = with pkgs; [
    ghidra
    ghidra-extensions.machinelearning
    ghidra-extensions.gnudisassembler
    ghidra-extensions.ghidraninja-ghidra-scripts
  ];
}
