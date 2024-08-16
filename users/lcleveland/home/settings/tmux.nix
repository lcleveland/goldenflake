{ lib, config, pkgs, settings, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    home-manager.users.${config.users.lcleveland.username}.programs.tmux = {
      enable = true;
      extraConfig = ''
        set-option -g default-shell ${pkgs.${config.users.lcleveland.default_shell}}/bin/${config.users.lcleveland.default_shell}
        set-window-option -g mode-keys vi
        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R
      '';
    };
  };
}
