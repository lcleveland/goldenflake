{ lib, pkgs, config, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    environment.pathsToLink = [ "/share/zsh" ];
    users.users.${config.users.lcleveland.username}.shell = pkgs.${config.users.lcleveland.default_shell};
    home-manager.users.${config.users.lcleveland.username}.programs.zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      enableVteIntegration = true;
      history.ignoreAllDups = true;
      oh-my-zsh =
        {
          enable = true;
          theme = "alanpeabody";
          plugins = [
            "fzf"
            "rust"
            "sudo"
            "tmux"
            "zsh-interactive-cd"
          ];
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
