{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    adoptopenjdk-icedtea-web
  ];
}
