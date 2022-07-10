{ lib, config, inputs, ... }:

{
  home-manager.users.toms = { pkgs, ... }: {
    home.file.".Xdefaults".source =
      ../../files/urxvt/Xresources;
  };
}
