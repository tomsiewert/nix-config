{ config, lib, pkgs, inputs, ... }:
let
  hostname = "mobilerschrott";
in
{
  imports = [
    ./hardware-configuration.nix
    ./fonts.nix
    ./network.nix
    ./packages.nix
    ./wireguard.nix
    ../../modules/sops
    ../../modules/sound
    ../../common/base
    ../../common/docker
    ../../common/i3
    ../../common/bluetooth.nix
    ../../common/network/networkmanager.nix
    ../../users/toms
  ];

  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
      };
    };
    initrd = {
      luks = {
        devices."luks-66fb815a-8ff7-4fe8-92fd-9869d86c5756" = {
          device = "/dev/disk/by-uuid/66fb815a-8ff7-4fe8-92fd-9869d86c5756";
          preLVM = true;
          allowDiscards = true;
        };
      };
    };
  };

  hardware.opengl.driSupport32Bit = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.xserver = {
    libinput.touchpad.naturalScrolling = true;
    videoDrivers = [
      "amdgpu"
    ];
  };

  networking = {
    hostName = hostname;
    extraHosts =
      ''
        172.18.1.110 iceportal.de
        127.0.0.1    redis
      '';
  };

  time.timeZone = "Europe/Berlin";

  system.stateVersion = "21.11";
}
