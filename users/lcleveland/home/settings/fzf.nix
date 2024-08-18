{ lib, config, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    home-manager.users.${config.users.lcleveland.username}.programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      tmux.enableShellIntegration = true;
    };
  };
}
