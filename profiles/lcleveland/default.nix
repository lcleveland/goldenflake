{ home-manager, settings, ... }: {
  imports = [
    ./${settings.profile}
  ];
  users.users.${settings.username} = {
    isNormalUser = true;
    description = settings.name;
    extraGroups = settings.user_groups;
  };
  home-manager.users.${settings.username} = {
    home.stateVersion = settings.state_version;
  };
}
