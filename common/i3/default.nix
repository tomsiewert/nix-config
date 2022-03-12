{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ../graphics
  ];

  services.xserver = {
    displayManager.defaultSession = "none+i3";

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        rofi
        i3status
        i3lock
        i3blocks
        i3pystatus
      ];
    };
  };
}
