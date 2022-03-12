{ config, lib, pkgs, inputs, ... }:

{
  networking = {
    networkmanager = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    pkgs.gnome.networkmanagerapplet
  ];
}
