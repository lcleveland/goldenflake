{ pkgs, settings, ... }: {
  home-manager.users.${settings.username}.home.packages = with pkgs; [
    (python3Full.withPackages (python-pkgs: [
      python312Packages.pynvim
    ]))
  ];
}
