{ pkgs, ... }: {
  environment.systemPackages = with pkgs.gnomeExtensions; [
    dash-to-panel
  ];
}
