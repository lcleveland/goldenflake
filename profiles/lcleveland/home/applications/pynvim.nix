{ pkgs, settings, ... }: {
  home-manager.users.${settings.username}.home.packages = with pkgs; [
    (python311.withPackages (python-pkgs: [
      python311Packages.pynvim
    ]))
  ];
}
