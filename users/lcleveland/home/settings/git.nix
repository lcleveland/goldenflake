{ settings, ... }: {
  home-manager.users.${settings.username}.programs.git = {
    enable = true;
    userName = settings.name;
    userEmail = settings.email;
  };
}
