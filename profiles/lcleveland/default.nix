{ settings, ... }: {
  imports = [
    ./${settings.profile}.nix
  ];
  users.users.${settings.username} = {
    isNormalUser = true;
    description = settings.name;
    extraGroups = settings.user_groups;
  };
}
