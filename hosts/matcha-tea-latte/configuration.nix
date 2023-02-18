{ config, lib, pkgs, inputs, ... }:
let
  hostname = "matcha-tea-latte";
in
{
  imports = [
    ./hardware-configuration.nix
    ./fonts.nix
    ./packages.nix
    ./vagrant.nix
    ../../modules/sound
    ../../modules/sops
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
        devices."luks-b4e5f6c0-2628-4cf0-973c-c868581d283b" = {
          device = "/dev/disk/by-uuid/b4e5f6c0-2628-4cf0-973c-c868581d283b";
          preLVM = true;
          allowDiscards = true;
        };
      };
    };
  };

  hardware.opengl.driSupport32Bit = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

  boot.kernelPackages = pkgs.unstable.linuxPackages_latest;

  services.xserver = {
    libinput.touchpad.naturalScrolling = true;
    videoDrivers = [
      "nvidia"
    ];
  };

  networking = {
    hostName = hostname;
  };

  time.timeZone = "Europe/Berlin";

  system.stateVersion = "22.05";
}
