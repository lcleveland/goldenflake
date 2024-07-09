{ pkgs, settings, ... }: {
  home-manager.users.${settings.username}.home.packages = with pkgs; [
    (python3.withPackages (python-pkgs: [
      python312Packages.pynvim
      python312Packages.pypamtest
    ]))
  ];
}
