{ lib, config, inputs, ... }:

{
  home-manager.users.toms = { pkgs, ... }: {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode;
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
      ];
    };
  };
}
