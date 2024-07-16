{ pkgs, settings, ... }: {
  qt.style = settings.qt_style;
  services = {
    xserver = {
      excludePackages = with pkgs; [
        xterm
      ];
      desktopManager = {
        gnome = {
          enable = true;
          extraGSettingsOverrides = ''
            	  [org.gnome.mutter.wayland]
            	  xwayland-disable-extension  '["Xtest"]'
            	'';
        };
        xterm.enable = false;
      };
    };
    udev.packages = with pkgs.gnome; [ gnome-settings-daemon ];
  };
  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    gnome-terminal
    gnome-console
    gnome-connections
    gnome-text-editor
    gedit
    epiphany
    geary
    evince
    totem
  ]) ++ (with pkgs.gnome; [
    gnome-characters
    gnome-music
  ]);
  nixpkgs.overlays = [
    (final: prev: {
      gnome = prev.gnome.overrideScope (gnomeFinal: gnomePrev: {
        mutter = gnomePrev.mutter.overrideAttrs (old: {
          src = pkgs.fetchFromGitLab {
            domain = "gitlab.gnome.org";
            owner = "vanvugt";
            repo = "mutter";
            rev = "triple-buffering-v4-46";
            hash = "sha256-nz1Enw1NjxLEF3JUG0qknJgf4328W/VvdMjJmoOEMYs=";
          };
        });
      });
    })
  ];
  nixpkgs.config.allowAliases = false;
}
