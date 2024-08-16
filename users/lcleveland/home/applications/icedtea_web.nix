{ lib, config, pkgs, ... }: {
  config = lib.mkIf config.users.lcleveland.enable {
    environment.systemPackages = with pkgs; [
      adoptopenjdk-icedtea-web
    ];
  };
}
