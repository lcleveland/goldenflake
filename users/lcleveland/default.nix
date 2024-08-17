{ pkgs, lib, config, ... }:
let
  cfg = config.users.lcleveland;
in
{
  imports = [
    ./home
  ];
  options.users.lcleveland = {
    enable = lib.mkOption {
      description = lib.mdDoc "Enable the Lyle user";
      default = false;
      type = lib.types.bool;
    };
    username = lib.mkOption {
      description = lib.mdDoc "The username of the Lyle user";
      default = "lcleveland";
      type = lib.types.str;
    };
    name = lib.mkOption {
      description = lib.mdDoc "The name of the Lyle user";
      default = "Lyle Cleveland";
      type = lib.types.str;
    };
    email = lib.mkOption {
      description = lib.mdDoc "The email of the Lyle user";
      default = "lyle.cleveland@proton.me";
      type = lib.types.str;
    };
    groups = lib.mkOption {
      description = lib.mdDoc "The groups of the Lyle user";
      default = [ "wheel" "networkmanager" "libvirtd" "kvm" "kismet" ];
      type = lib.types.listOf lib.types.str;
    };
    state_version = lib.mkOption {
      description = lib.mdDoc "The NixOS state version to use";
      default = "24.05";
      type = lib.types.str;
    };
    default_shell = lib.mkOption {
      description = lib.mdDoc "The default shell";
      default = "zsh";
      type = lib.types.str;
    };
    default_editor = lib.mkOption {
      description = lib.mdDoc "The default editor";
      default = "neovim";
      type = lib.types.str;
    };
    default_terminal = lib.mkOption {
      description = lib.mdDoc "The default terminal";
      default = "kitty";
      type = lib.types.str;
    };
    default_browser = lib.mkOption {
      description = lib.mdDoc "The default browser";
      default = "opera";
      type = lib.types.str;
    };
  };
  config = lib.mkIf cfg.enable {
    users.users.lcleveland = {
      isNormalUser = true;
      description = cfg.name;
      extraGroups = cfg.groups;
    };
    users.lcleveland.home.applications.browsers.${cfg.default_browser}.enable = true;
    home-manager.users.lcleveland = {
      home.username = cfg.username;
      home.stateVersion = cfg.state_version;
      dconf = {
        settings = {
          "org/gnome/shell" = {
            enabled-extensions = with pkgs.gnomeExtensions; [
              blur-my-shell.extensionUuid
              dash-to-panel.extensionUuid
              appindicator.extensionUuid
              clipboard-indicator.extensionUuid
            ];
          };
          "org/virt-manager/virt-manager/connections" = {
            autoconnect = [ "qemu:///system" ];
            uris = [ "qemu:///system" ];
          };
        };
      };

    };
  };
}
