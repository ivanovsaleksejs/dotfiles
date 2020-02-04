# List packages installed in system profile. To search by name, run:
# $ nix-env -qaP | grep wget
{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  programs.npm.enable = true;

  environment.systemPackages = with pkgs; [

    # system
    bash
    dbus
    gksu
    htop
    mtpfs
    wget

    # terminals and utils
    # adafruit-ampy
    arp-scan
    bc
    cool-retro-term
    direnv
    file
    gnome3.gnome-keyring
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
    screen
    systemd
    terminator
    tmux
    udev
    vscode
    xclip
    xss-lock
    xterm

    # UI
    dmenu
    dunst
    feh
    fzf
    gnome-themes-extra
    gnome3.adwaita-icon-theme
    gsimplecal
    gwenview
    i3blocks
    kdeApplications.okular
    lxappearance
    networkmanager_dmenu
    networkmanager_openconnect
    networkmanager_openvpn
    spectacle
    volumeicon
    xautolock
    xorg.xbacklight

    # Network
    avahi
    curl_unix_socket
    libreoffice
    mod_dnssd
    networkmanagerapplet
    nssmdns
    openvpn
    pptp
    x2goclient

    # Audio
    audacious
    blueman
    openconnect
    pavucontrol
    pulseaudioFull

    # Printers
    cups
    cups-filters
    gutenprint
    p910nd
    samsung-unified-linux-driver
    simple-scan
    splix
    system_config_printer
    xsane

    # Utils
    arandr
    asciinema
    bind
    google-authenticator
    krusader
    ranger
    unrar
    unzip
    virtualbox
    wine
    xmlindent

    # Programming
    arduino
    bison
    cabal-install
    esptool
    flex
    gcc
    ghc
    git
    git-crypt
    gnumake
    gperf
    libstdcxx5
    libftdi1
    mcrypt
    mysql
    ncurses
    nginx
    nixops
    nodePackages.node2nix
    nodejs
    perl
    php
    php73Packages.composer
    postgresql
    python37Packages.pyserial
    (python35.withPackages(ps: with ps; [ setuptools jinja2 ]))
    python37Packages.setuptools
    redis
    stack
    subversion
    yarn
    ycmd

    # Apps
    # caprine
    chromium
    discord
    easytag
    gimp
    google-chrome
    imagemagick
    inkscape
    qbittorrent
    ktorrent
    # messenger-for-desktop
    moc
    mpv
    skypeforlinux
    spotify
    steam
    tdesktop
    teamviewer
    tuxguitar
    vlc
    weechat
    wireshark

    # Gaming
    openmw

    # XFCE

  ];
}
