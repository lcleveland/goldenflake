{ settings, pkgs, ... }: {
  users.users.${settings.username}.shell = pkgs.${settings.default_shell};
  home-manager.users.${settings.username}.programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableVteIntegration = true;
    oh-my-zsh =
      {
        enable = true;
        theme = "kennethreitz";
      };
    history = {
      size = 10000;
      path = "/home/${settings.username}/.config/zsh/history";
    };
    initExtra = ''
      if [ "$TMUX" = "" ]; then tmux; fi
    '';
  };
}
