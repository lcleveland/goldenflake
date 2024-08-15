{
  description = "A system configuration meant to bring Fedora Silverblue concepts to NixOS with imrovements";

  outputs = inputs@{ self, nixpkgs, home-manager, nixvim, ... }:
    let
      settings = {
        system = "x86_64-linux";
        printing_support = true;
        username = "lcleveland";
        name = "Lyle Cleveland";
        email = "lyle.cleveland@proton.me";
        user_groups = [ "wheel" "networkmanager" "libvirtd" "kvm" "kismet" ];
        default_browser = "";
        state_version = "24.05";
        nvidia = false;
        nvidia_driver = "beta";
        default_editor = "neovim";
        default_terminal = "kitty";
        default_shell = "zsh";
        profile = "home";
        wayland = true;
        qt_style = "adwaita-dark";
        gtk_theme = "Adwaita-dark";
        enable_fingerprint = true;
      };
    in
    {
      nixosConfigurations.system = nixpkgs.lib.nixosSystem {
        system = settings.system;
        modules = [
          ./system
          ./profiles/${settings.username}
          ./configs/home.nix
          home-manager.nixosModules.home-manager
        ];
        specialArgs = {
          inherit settings;
          inherit inputs;
        };
      };
    };
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
