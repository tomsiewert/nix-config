{
  description = "NixOS configs by Tom";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-21.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-21.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, ... }: {
    nixosConfigurations = {
      mobilerschrott = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        configuration = ./hosts/mobilerschrott;
        specialArgs = { inherit inputs; };
      };
    };

    homeConfigurations = {
      toms = inputs.home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        homeDirectory = "/home/toms";
        username = "toms";
      };
    };
  };
}
