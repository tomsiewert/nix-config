{ lib, config, inputs, ... }:

{
  home-manager.users.toms = { pkgs, ... }: {
    home.file.".Xresources".source =
      ../../files/urxvt/Xresources;
  };
}
