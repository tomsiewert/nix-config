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
    xz
    zstd
    bind
    whois
    age
    sops

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

    # lutris
    gnome3.adwaita-icon-theme
    lutris

    # communication
    master.discord
    element-desktop
    openvpn
    remmina
    tdesktop
    unstable.tmate
    wireguard-tools
    (pkgs.unstable.mumble.override { pulseSupport = true; })

    # misc
    keepassxc
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
    ripgrep
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
    java = { enable = true; package = pkgs.jdk11; };
    mtr.enable = true;
    gnupg.agent.enable = true;
    zsh.enable = true;
  };
}
