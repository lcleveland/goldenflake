{ pkgs, settings, ... }: {
  imports = [
    ./${settings.profile}
  ];
  users.users.${settings.username} = {
    isNormalUser = true;
    description = settings.name;
    extraGroups = settings.user_groups;
  };
  home-manager.useGlobalPkgs = true;
  home-manager.users.${settings.username} = {
    home.username = settings.username;
    home.stateVersion = "24.05";
    dconf = {
      settings = {
        "org/gnome/shell" = {
          enabled-extensions = with pkgs.gnomeExtensions; [
            blur-my-shell.extensionUuid
            dash-to-panel.extensionUuid
            appindicator.extensionUuid
            clipboard-indicator.extensionUuid
          ];
        };
        "org/virt-manager/virt-manager/connections" = {
          autoconnect = [ "qemu:///system" ];
          uris = [ "qemu:///system" ];
        };
      };
    };

  };
}
