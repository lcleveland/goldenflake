{ pkgs, settings, ... }: {
  home-manager.users.${settings.username}.dconf = {
    enable = true;
    settings."org/gnome/shell" = {
      enabled-extensions = with pkgs.gnomeExtensions; [
        blur-my-shell.extensionUuid
        gsnap.extensionUuid
        dash-to-panel.extensionUuid
        appindicator.extensionUuid
      ];
    };
  };
}
