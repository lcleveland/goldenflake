{ pkgs, config, lib, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    home-manager.users.${config.users.lcleveland.username}.home.packages = with pkgs; [
      fira-code
      fira-code-nerdfont
      fira-code-symbols
    ];
  };
}
