# List packages installed in system profile. To search by name, run:
# $ nix-env -qaP | grep wget
{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    # system
    bash
    dbus
    gksu
    htop
    wget

    # terminals and utils
    bc
    cool-retro-term
    direnv
    file
    home-manager
    kdiff3
    libnotify
    lshw
    neovim
    ntfs3g
    openssl
    patchelf
    sysstat
    pmutils
    sshpass
    steam-run
    terminator
    tmux
    vscode
    xclip
    xss-lock
    xterm

    # UI
    breeze-gtk
    dmenu
    dunst
    gsimplecal
    gwenview
    i3-gaps
    i3blocks
    kdeApplications.okular
    lxappearance
    networkmanager_dmenu
    networkmanager_openconnect
    networkmanager_openvpn
    openjdk10
    qiv
    spectacle
    xautolock
    xorg.xbacklight

    # Network
    avahi
    curl_unix_socket
    libreoffice
    mod_dnssd
    nssmdns
    openvpn
    pptp

    # Audio
    blueman
    openconnect
    pavucontrol
    pulseaudioFull

    # Printers
    cups
    cups-filters
    ghostscript
    ghostscriptX
    gutenprint
    p910nd
    samsung-unified-linux-driver
    simple-scan
    system_config_printer
    xsane

    # Utils
    arandr
    krusader
    unrar
    unzip
    wine
    xmlindent

    # Programming
    cabal-install
    gcc
    ghc
    git
    git-crypt
    gnumake
    yarn
    libstdcxx5
    mcrypt
    mysql
    nginx
    nixops
    nodejs
    nodePackages.node2nix
    perl
    php
    php71Packages.composer
    redis
    stack
    subversion
    yarn

    # Apps
    chromium
    discord
    gimp
    google-chrome
    imagemagick
    inkscape
    ktorrent
    mpv
    skype
    spotify
    steam
    tuxguitar
    vlc
    weechat
    wireshark
  ];
}
