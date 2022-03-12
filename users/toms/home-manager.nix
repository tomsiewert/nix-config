{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules."home-manager"
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.toms = { pkgs, ... }: {
    home.stateVersion = "21.11";
    home.sessionVariables = {
      EDITOR = "vim";
    };
    programs = {
      home-manager.enable = true;
    };
    home.packages = with pkgs; [
      git-crypt
      xclip
    ];
  };
}
