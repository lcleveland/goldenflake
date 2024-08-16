{ lib, pkgs, config, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    users.users.${config.users.lcleveland.username}.shell = pkgs.${config.users.lcleveland.default_shell};
    home-manager.users.${config.users.lcleveland.username}.programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      enableVteIntegration = true;
      oh-my-zsh =
        {
          enable = true;
          theme = "nicoulaj";
        };
      history = {
        size = 10000;
        path = "/home/${config.users.lcleveland.username}/.config/zsh/history";
      };
      initExtra = ''
        if [ "$TMUX" = "" ]; then tmux; fi
      '';
    };
  };
}
