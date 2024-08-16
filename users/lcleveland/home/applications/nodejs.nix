{ lib, config, pkgs, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    environment.systemPackages = with pkgs; [
      nodePackages_latest.nodejs
    ];
  };
}
