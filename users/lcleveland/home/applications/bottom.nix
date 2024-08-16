{ pkgs, config, ... }: {
  home-manager.users.${config.users.lcleveland.name}.home.packages = with pkgs; [ bottom ];
}
