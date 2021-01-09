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
    sshfs
    wget

    # terminals and utils
    # adafruit-ampy
    alacritty
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
    metasploit
    miraclecast
    gnome3.nautilus
    neovim
    ntfs3g
    openssl
    patchelf
    perl532Packages.FileMimeInfo
    sysstat
    p7zip
    pmutils
    sshpass
    steam-run
    screen
    systemd
    terminator
    tmux
    udev
    #vscode
    wmctrl
    xclip
    xdotool
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
    networkmanager_strongswan
    spectacle
    strongswan
    strongswanNM
    volumeicon
    xautolock
    xorg.xbacklight
    xfce.xfce4-screenshooter

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
    #xsane

    # Utils
    arandr
    asciinema
    bind
    google-authenticator
    krusader
    ranger
    unrar
    unzip
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
#    libstdcxx5
    libftdi1
    #libudev
    mailutils
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
    php73Extensions.xdebug
    postfix
    postgresql
    python37Packages.pyserial
    (python37.withPackages(ps: with ps; [ setuptools jinja2 ]))
    python37Packages.setuptools
    redis
    stack
    subversion
    #udev
    yarn
    ycmd

    # Apps
    # caprine
    anydesk
    chromium
    discord
    easytag
    firefox
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
    teams
    vlc
    weechat
    wireshark
    zoom-us

    # Gaming
    openmw

  ];
}
