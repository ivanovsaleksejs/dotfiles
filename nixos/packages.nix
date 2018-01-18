# List packages installed in system profile. To search by name, run:
# $ nix-env -qaP | grep wget
{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    bash
    bc
    wget
    pulseaudioFull
    pavucontrol
    dbus
    xorg.xbacklight
    htop
    gksu
    lxappearance
    dmenu
    networkmanager_dmenu
    networkmanager_pptp
    networkmanager_openvpn
    neovim
    xterm
    terminator
    alacritty
    xclip
    google-chrome
    chromium
    firefox
    weechat
    skype
    discord
    git
    dunst
    libnotify
    unzip
    i3-gaps
    i3blocks
    pptp
    openvpn
    blueman
    mpv
    spotify
    nginx
    #fcgiwrap
    subversion
    redis
    php
    php71Packages.composer
    mysql
    openssl
    mcrypt
    sshpass
    spectacle
    gimp
    xmlindent
    cups
    cups-filters
    system_config_printer
    nssmdns
    avahi
    mod_dnssd
    p910nd
    ghostscript
    ghostscriptX
    libreoffice
    curl_unix_socket
    wireshark
    gutenprint
    perl
    teamviewer
    samsung-unified-linux-driver
    nodejs
    imagemagick
  ];
}
