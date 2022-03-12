{ config, lib, pkgs, inputs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";
    libinput.enable = true;

    desktopManager.xterm.enable = false;
  };

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      hplip
    ];
  };

  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    pkgs.gnome.networkmanagerapplet
  ];
}
