{ pkgs, inputs, ... }:

{
  home-manager.users.toms = { pkgs, ... }: {
    programs.gpg.enable = true;

    services.gpg-agent = {
      enable = true;
      enableExtraSocket = true;
    };
  };
}
