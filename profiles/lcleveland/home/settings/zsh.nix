{ settings, pkgs,... }: {
users.users.myuser.shell = pkgs.${settings.default_shell};
home-manager.users.${settings.username}.programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableVteIntegration = true;
    history = {
      size = 10000;
      path = "/home/${settings.username}/.config/zsh/history";
    };
  };
}
