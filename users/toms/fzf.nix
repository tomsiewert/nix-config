{ lib, config, inputs, ... }:

{
  home-manager.users.toms = { pkgs, ... }: {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
