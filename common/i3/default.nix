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
        (pkgs.i3pystatus.overrideAttrs (oldAttrs: {
          patches = [ ./i3pystatus-wifionice.patch ];
          propagatedBuildInputs = [pkgs.python310Packages.dbus-python] ++ oldAttrs.propagatedBuildInputs;
        }))
      ];
    };
  };
}
