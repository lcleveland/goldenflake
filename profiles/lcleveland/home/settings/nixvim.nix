{ inputs, settings, ... }: {
  home-manager.users.${settings.username} = {
    imports = [
      inputs.nixvim.homeManagerModules.nixvim
    ];
  };
}
