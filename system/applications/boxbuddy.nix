{ pkgs, ... }: {
  environment.systemPackages = with pkgs;[
    boxbuddy
  ];
}
