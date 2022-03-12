{ lib, config, inputs, ... }:

{
  home-manager.users.toms = { pkgs, ... }: {
    programs.go = {
      enable = true;
    };
  };
}
