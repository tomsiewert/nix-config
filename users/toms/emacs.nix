{ lib, ... }:

{
  home-manager.users.toms = { pkgs, ... }: {
    programs.emacs = {
      enable = true;
    };
  };
}
