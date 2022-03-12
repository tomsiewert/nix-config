{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # generic
    curl
    efibootmgr
    ethtool
    git
    git-lfs
    gparted
    htop
    man-pages
    p7zip
    wget
    xz
    zstd
    bind
    whois

    # browser
    firefox
    google-chrome

    # editor
    nano
    vim

    # office
    evince
    libreoffice

    # video
    arandr
    glxinfo
    vlc

    # mail
    thunderbird

    # communication
    discord
    openvpn
    remmina
    tdesktop
    tmate
    wireguard
    (pkgs.mumble.override { pulseSupport = true; })

    # misc
    asciinema
    scrot
    gnome.file-roller

    # development
    bundix
    nix-prefetch-git
    nodejs
    python3
    ruby
    wireshark
    yarn

    # terminal
    rxvt-unicode

    # management
    azure-cli
    fluxcd
    kubectl
    kubernetes-helm
    velero

    # voice
    spotify
  ];

  programs = {
    mtr.enable = true;
    gnupg.agent.enable = true;
    zsh.enable = true;
  };
}
