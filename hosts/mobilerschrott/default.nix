# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
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
      };
    };

    initrd = {
      luks = {
        fido2Support = true;
        devices."luks-66fb815a-8ff7-4fe8-92fd-9869d86c5756" = {
          device = "/dev/disk/by-uuid/66fb815a-8ff7-4fe8-92fd-9869d86c5756";
          fido2 = {
            passwordLess = true;
            gracePeriod = 120;
            credential = "eb2b91e44c05f3a92ab38f45a41dd1b14950e4a062330a07e07e981afcce63360f2b728147a1e545fc4ed26beec4d296";
          };
        };
      };
    };
  };

  networking = {
    hostName = "mobilerschrott";
    networkmanager = {
      enable = true;
    };
  };

  nix = {
    # Automate `nix-store --optimise`
    autoOptimiseStore = true;

    # Automate garbage collection
    gc = {
      automatic = true;
      dates     = "weekly";
      options   = "--delete-older-than 7d";
    };

    # Avoid unwanted garbage collection when using nix-direnv
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';

    trustedUsers = [ "root" "@wheel" ];
  };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    # X-Server configuration
    xserver = {
      enable = true;
      layout = "us";
      videoDrivers = [
        "amdgpu"
      ];

      libinput = {
        enable = true;
      };

      desktopManager = {
        xterm.enable = false;
      };

      displayManager = {
        defaultSession = "none+i3";
      };

      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          rofi
          i3status
          i3lock
          i3blocks
       ];
      };
    };

    # Enable CUPS to print documents.
    printing = {
      enable = true;
    };

    gnome = {
      gnome-keyring.enable = true;
    };
  };

  # Enable sound.
  sound = {
    enable = true;
  };
  hardware.pulseaudio.enable = true;

  users.users.${username} = {
    description = name;
    isNormalUser = true;
    createHome = true;
    shell = pkgs.zsh;
    home = "/home/${username}";
    extraGroups = [ "wheel" "NetworkManager" ];
  };

  home-manager.users.${username} = import ./home-manager;

  environment.systemPackages = with pkgs; [
    arandr
    curl
    git
    htop
    openvpn
    python3
    vim
    wget
    wireguard-tools
  ];

  programs = {
    mtr.enable = true;

    gnupg.agent = {
      enable = true;
    };
    zsh.enable = true;
  };

  system.stateVersion = "21.11";
}
