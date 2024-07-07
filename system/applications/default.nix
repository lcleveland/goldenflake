{ settings, ... }: {
  imports = [
    ./editors/${settings.default_editor}.nix
    ./terminals/${settings.default_terminal}.nix
    ./git_credential_oauth.nix
    ./podman_compose.nix
  ];
}
