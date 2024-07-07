{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.ptyxis
  ];
}
