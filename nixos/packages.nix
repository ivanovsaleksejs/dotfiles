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
    direnv
    libnotify
    lshw
    neovim
    openssl
    pmutils
    sshpass
    terminator
    tmux
    vscode
    xclip
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
    hplip
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
    ghc
    git
    git-crypt
    gnumake
    mcrypt
    mysql
    nginx
    nixops
    nodejs
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
