{ pkgs, ... }: {
  environment.systemPackages = with pkgs.gnomeExtensions; [
    clipboard-indicator
  ];
}
