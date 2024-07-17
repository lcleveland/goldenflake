{ settings, config, ... }: {

  home-manager.users.${settings.username}.programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history = {
      size = 1000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
