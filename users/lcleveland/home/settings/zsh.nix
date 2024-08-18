{ lib, pkgs, config, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    environment.pathsToLink = [ "/share/zsh" ];
    users.users.${config.users.lcleveland.username}.shell = pkgs.${config.users.lcleveland.default_shell};
    home-manager.users.${config.users.lcleveland.username}.programs.zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      enableVteIntegration = true;
      history.ignoreAllDups = true;
      plugins = [
        {
          name = "zsh-autosuggestions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "v0.7.0";
            sha256 = "sha256-KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
          };
        }
      ];
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
