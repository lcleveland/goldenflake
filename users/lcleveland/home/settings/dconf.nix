{ pkgs, config, ... }: {
  home-manager.users.${config.users.lcleveland.username}.dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        enabled-extensions = with pkgs.gnomeExtensions; [
          gsnap.extensionUuid
        ];
      };
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
    };
  };
}
