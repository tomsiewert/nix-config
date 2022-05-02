{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # generic
    ag
    curl
    delta
    dmidecode
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
    element-desktop
    openvpn
    remmina
    tdesktop
    unstable.tmate
    wireguard
    (pkgs.unstable.mumble.override { pulseSupport = true; })

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
    virtualenv
    wireshark
    yarn

    # terminal
    rxvt-unicode

    # management
    azure-cli
    fluxcd
    hcloud
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
