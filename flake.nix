{
  description = "NixOS configs by Tom";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";

    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, agenix, home-manager }:
    let
      overlay-unstable = final: prev: {
        unstable = import inputs.nixpkgs-unstable { system = final.system; };
      };
    in {
      nixosConfigurations = {
        mobilerschrott = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ({ config, pkgs, ...}: { nixpkgs.overlays = [ overlay-unstable ]; })
            ./hosts/mobilerschrott/configuration.nix
          ];
          specialArgs = { inherit inputs; };
        };
        iso = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
            ./iso
          ];
        };
      };
    };
}
