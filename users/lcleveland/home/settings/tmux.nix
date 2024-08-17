{ lib, config, pkgs, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    home-manager.users.${config.users.lcleveland.username}.programs.tmux = {
      enable = true;
      keyMode = "vi";
      mouse = true;
      customPaneNavigationAndResize = true;
      extraConfig = ''
        set-option -g default-shell ${pkgs.${config.users.lcleveland.default_shell}}/bin/${config.users.lcleveland.default_shell}
      '';
      plugins = with pkgs.tmuxPlugins; [
        tokyo-night-tmux
      ];
    };
  };
}
