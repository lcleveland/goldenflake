{ settings, home-manager, ... }: {
  home-manager.users.${settings.username}.programs.git = {
    userName = settings.name;
    userEmail = settings.email;
  };
}
