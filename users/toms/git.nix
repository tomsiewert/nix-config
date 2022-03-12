{ lib, config, inputs, ... }:

{
  home-manager.users.toms = { pkgs, ... }: {
    programs.git = {
      enable = true;
      userName = "Tom Siewert";
      userEmail = "tom@siewert.io";
    };
  };
}
