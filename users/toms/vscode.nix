{ lib, config, inputs, ... }:

{
  home-manager.users.toms = { pkgs, ... }: {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode;
      extensions = map
      (extension: pkgs.vscode-utils.buildVscodeMarketplaceExtension{
        mktplcRef = {
          inherit (extension) name publisher version sha256;
        };
      })
      (import ./vscode-extensions.nix).extensions;
    };
  };
}
