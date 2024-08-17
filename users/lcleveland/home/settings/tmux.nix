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
        yank
        {
          plugin = tokyo-night-tmux;
          extraConfig = ''
            set -g @tokyo-night-tmux_window_id_style digital
            set -g @tokyo-night-tmux_pane_id_style hsquare
            set -g @tokyo-night-tmux_zoom_id_style dsquare
          '';
        }
      ];
    };
  };
}
