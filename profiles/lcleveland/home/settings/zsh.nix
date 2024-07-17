{ settings, pkgs, ... }: {
  users.users.${settings.username}.shell = pkgs.zsh;
  home-manager.users.${settings.username} = {
    shell = pkgs.zsh;
    programs.zsh = {
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
  };
}
