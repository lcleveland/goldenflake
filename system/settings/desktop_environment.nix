{ pkgs, settings, ... }: {
  qt.style = settings.qt_style;
  services = {
    xserver = {
      excludePackages = with pkgs; [
        xterm
      ];
      desktopManager = {
        gnome.enable = true;
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
    gedit
    epiphany
    geary
    evince
    totem
  ]) ++ (with pkgs.gnome; [
    gnome-characters
    gnome-music
  ]);

}
