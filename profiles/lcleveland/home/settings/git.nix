{ settings, ... }: {
  programs.git = {
    userName = settings.name;
    userEmail = settings.email;
  };
}
