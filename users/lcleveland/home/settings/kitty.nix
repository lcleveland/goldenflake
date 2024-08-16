{ config, ... }: {
  home-manager.users.${config.users.lcleveland.username}.programs.kitty = {
    shellIntegration.enableZshIntegration = true;
  };
}
