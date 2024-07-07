{ settings, ... }: {
  imports = [
    ./${settings.profile}
  ];
  users.users.${settings.username} = {
    isNormalUser = true;
    description = settings.name;
    extraGroups = settings.user_groups;
  };
}
