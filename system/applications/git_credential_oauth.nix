{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git-credential-oauth
  ];
}
