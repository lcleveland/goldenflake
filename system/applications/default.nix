{ settings, ... }: {
  imports = [
    ./editors/${settings.default_editor}.nix
    ./terminals/${settings.default_terminal}.nix
    ./git_credential_oauth.nix
    ./podman_compose.nix
    ./distrobox.nix
    ./boxbuddy.nix
    ./virt_manager.nix
    ./adwaita_icon_theme.nix
    ./appindicator.nix
    ./blur_my_shell.nix
    ./dash_to_panel.nix
    ./gcc.nix
    ./clipboard_indicator.nix
    ./wl_clipboard.nix
    ./shells/${settings.default_shell}.nix
  ];
}
