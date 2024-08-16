{
  description = "A system configuration meant to bring Fedora Silverblue concepts to NixOS with imrovements";

  outputs = inputs@{ self, nixpkgs, home-manager, nixvim, ... }:
    let
      settings = {
        system = "x86_64-linux";
      };
    in
    {
      nixosConfigurations.system = nixpkgs.lib.nixosSystem {
        system = settings.system;
        modules = [
          ./system
          ./users
          ./configs/home.nix
          home-manager.nixosModules.home-manager
        ];
        specialArgs = {
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
