{ config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # generic
    bc
    curl
    delta
    dmidecode
    efibootmgr
    ethtool
    git
    git-lfs
    gparted
    htop
    jq
    man-pages
    p7zip
    silver-searcher
    wget
    restic
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

    # games
    gnome3.adwaita-icon-theme
    lutris
    steam

    # communication
    discord
    element-desktop
    openvpn
    remmina
    tdesktop
    unstable.tmate
    wireguard-tools
    (pkgs.unstable.mumble.override { pulseSupport = true; })

    # misc
    unstable.anydesk
    asciinema
    pwgen
    scrot
    sipcalc
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
    unstable.fluxcd
    hcloud
    kubectl
    kubernetes-helm
    unstable.velero

    # voice
    spotify
  ];

  programs = {
    mtr.enable = true;
    gnupg.agent.enable = true;
    zsh.enable = true;
  };
}
