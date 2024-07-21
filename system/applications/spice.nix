{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    spice
  ];
}
