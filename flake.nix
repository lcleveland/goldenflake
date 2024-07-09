{
  description = "A system configuration meant to bring Fedora Silverblue concepts to NixOS with imrovements";

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
    let
      settings = {
        system = "x86_64-linux";
        cpu_vendor = "amd";
        hostname = "DREAM";
        timezone = "America/Chicago";
        locale = "en_US.UTF-8";
        keyboard = { layout = "us"; variant = ""; };
        printing_support = true;
        username = "lcleveland";
        name = "Lyle Cleveland";
        email = "lyle.cleveland@proton.me";
        user_groups = [ "wheel" "networkmanager" "libvirtd" ];
        default_browser = "";
        state_version = "24.11";
        nvidia = true;
        nvidia_driver = "beta";
        default_editor = "neovim";
        default_terminal = "ptyxis";
        profile = "home";
        wayland = true;
        qt_style = "adwaita-dark";
      };
    in
    {
      nixosConfigurations.system = nixpkgs.lib.nixosSystem {
        system = settings.system;
        modules = [
          ./system
          ./profiles/${settings.username}
          home-manager.nixosModules.home-manager
        ];
        specialArgs = {
          inherit settings;
        };
      };
    };
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
}
