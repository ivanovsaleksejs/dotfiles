# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      /etc/nixos/bashrc.nix
      /etc/nixos/packages.nix
      /etc/nixos/ui.nix
      /etc/nixos/web.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    grub.gfxmodeEfi = "1024x576";
  };

  boot.kernelModules = [ "nf_conntrack_pptp" ];

  networking = {
    networkmanager.enable = true;
    firewall = {
      autoLoadConntrackHelpers = true;
      connectionTrackingModules = [ "pptp" ];
    };
  };

  hardware = {
    bluetooth.enable = true;
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
    };
  };

  services.printing = {
    enable = true;
    drivers  = [
      pkgs.gutenprint
      pkgs.gutenprintBin
      pkgs.splix
    ];
  };
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  services.avahi.allowPointToPoint = true;

  services.teamviewer.enable = true;

  services.logind.extraConfig = ''
    HandlePowerKey=ignore
  '';

  time.timeZone = "Europe/Riga";

  system.stateVersion = "17.09";

}
