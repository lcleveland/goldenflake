{ pkgs, ... }: {
  environment.systemPackages = with pkgs.gnomeExtensions; [
    appindicator
  ];
}
