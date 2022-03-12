{
  description = "NixOS configs by Tom";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
    agenix.url = "github:ryantm/agenix";

    home-manager = {
      url = "github:nix-community/home-manager/release-21.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, agenix, home-manager }: {
    nixosConfigurations = {
      mobilerschrott = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/mobilerschrott/configuration.nix ];
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
