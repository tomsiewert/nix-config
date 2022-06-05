{ lib, pkgs, ... }:
with lib;
{
  home-manager.users.toms = let
    devSDKs = with pkgs; {
      java11 = jdk11;
      java = jdk;
      maven = maven;
      python = python3;
      gradle = gradle;
      gradle6 = gradle_6;
    };
    extraPath = makeBinPath (builtins.attrValues devSDKs);
    intellij = pkgs.runCommand "intellij" {
      nativeBuildInputs = [ pkgs.makeWrapper ];
    } ''
      mkdir -p $out/bin
      makeWrapper ${pkgs.jetbrains.idea-ultimate}/bin/idea-ultimate \
        $out/bin/intellij \
        --prefix PATH : ${extraPath}
    '';
  in { ... }: {
    home.packages = [ intellij ];
    home.file.".local/dev".source = let
      mkEntry = name: value: {
        inherit name;
        path = value;
      };
      entries = mapAttrsToList mkEntry devSDKs;
    in pkgs.linkFarm "local-dev" entries;
  };
}
