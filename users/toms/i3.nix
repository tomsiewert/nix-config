{ lib, config, inputs, ... }:

{
  home-manager.users.toms = { pkgs, ... }: {
    home.file.".config/i3/config".source =
      ../../files/i3/config;

    home.file.".config/i3status/status.py".source =
      ../../files/i3/status.py;
  };
}
