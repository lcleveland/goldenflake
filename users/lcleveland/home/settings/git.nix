{ lib, config, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    home-manager.users.${config.users.lcleveland.username}.programs.git = {
      enable = true;
      userName = config.users.lcleveland.username;
      userEmail = config.users.lcleveland.email;
    };
  };
}
