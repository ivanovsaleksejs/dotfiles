# List packages installed in system profile. To search by name, run:
# $ nix-env -qaP | grep wget
{ config, pkgs, ... }:
let
  unstable = import
    (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz)
    # reuse the current configuration
    { config = config.nixpkgs.config; };
  old = import
    (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/nixos-20.09.tar.gz)
    # reuse the current configuration
    { config = config.nixpkgs.config; };
  superold = import
    (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/nixos-19.03.tar.gz)
    # reuse the current configuration
    { config = config.nixpkgs.config; };
in
{
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: 
    {
      small = import <nixos> 
      { 
        config = config.nixpkgs.config; 
      };
      old = import <old>
      {
        config = config.nixpkgs.config;
      };
      superold = import <superold>
      {
        config = config.nixpkgs.config;
      };
    };
  };
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
    binutils-unwrapped
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
    ripgrep
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
    old.kdeApplications.okular
    superold.source-sans-pro
    lxappearance
    networkmanager_dmenu
    networkmanager_openconnect
    networkmanager_openvpn
    networkmanager_strongswan
    qalculate-gtk
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
    wireguard
    wireguard-tools
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
    samsungUnifiedLinuxDriver
    simple-scan
    splix
    system_config_printer
    #xsane

    # Utils
    arandr
    asciinema
    bind
    dbeaver
    gitkraken
    gnome3.seahorse
    google-authenticator
    kicad-small
    keepass
    krusader
    mucommander
    ranger
    unrar
    unzip
    wine
    xmlindent

    # Programming
    arduino
    bison
    cabal-install
    docker
    docker-compose
    #esptool
    flex
    gcc
    ghc
    git
    git-crypt
    gnumake
    gperf
    haskellPackages.hakyll
    jekyll
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
    nodejs-14_x
    perl
    php
    php73
    php74Packages.composer
    php73Extensions.xdebug
    php74Extensions.pdo
    php74Extensions.pdo_dblib
    postfix
    postgresql
    python27Full
    python37Packages.pyserial
    (python37.withPackages(ps: with ps; [ setuptools jinja2 ]))
    python37Packages.setuptools
    redis
    stack
    subversion
    #udev
    vimPlugins.vim-xdebug
    yarn
    ycmd

    # Apps
    # caprine
    anydesk
    apple-music-electron
    chromium
    small.discord
    easytag
    firefox
    gimp
    google-chrome
    imagemagick
    inkscape
    qbittorrent
    # messenger-for-desktop
    mattermost-desktop
    moc
    mpv
    remmina
    signal-desktop
    skypeforlinux
    spotify
    steam
    tdesktop
    teams
    teamviewer
    vlc
    weechat
    wireshark

    # Gaming
    openmw

  ];
}
