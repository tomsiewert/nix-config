{
  description = "NixOS configs by Tom";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    sops-nix.url = "github:Mic92/sops-nix";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, nixpkgs-master, sops-nix, home-manager }:
    let
      overlay-unstable = final: prev: {
        unstable = import inputs.nixpkgs-unstable { config.allowUnfree = true; system = final.system; };
        master = import inputs.nixpkgs-master { config.allowUnfree = true; system = final.system; };
      };
    in {
      nixosConfigurations = {
        mobilerschrott = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ({ config, pkgs, ...}: { nixpkgs.overlays = [ overlay-unstable ]; })
            ./hosts/mobilerschrott/configuration.nix
            sops-nix.nixosModules.sops
          ];
          specialArgs = { inherit inputs; };
        };
        matcha-tea-latte = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ({ config, pkgs, ...}: { nixpkgs.overlays = [ overlay-unstable ]; })
            ./hosts/matcha-tea-latte/configuration.nix
            sops-nix.nixosModules.sops
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
