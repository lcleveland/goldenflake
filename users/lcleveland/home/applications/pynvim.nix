{ lib, pkgs, config, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    home-manager.users.${config.users.lcleveland.username}.home.packages = with pkgs; [
      (python3.withPackages (python-pkgs: [
        python312Packages.pynvim
      ]))
    ];
  };
}
