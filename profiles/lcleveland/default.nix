{ pkgs, settings, ... }: {
  imports = [
    ./${settings.profile}
  ];
  users.users.${settings.username} = {
    isNormalUser = true;
    description = settings.name;
    extraGroups = settings.user_groups;
  };
  home-manager.users.${settings.username} = {
    home.username = settings.username;
    home.stateVersion = settings.state_version;
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
