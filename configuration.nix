# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./packages.nix
      ./ui.nix
      ./web.nix
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
    hosts = {
      "127.0.0.1" = [
        "fastapi.local"
      ];
    };
  };

  hardware = {
    bluetooth.enable = true;
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
    };
  };

  time.timeZone = "Europe/Riga";

  environment.interactiveShellInit = ''
    alias vim=nvim
  '';

  system.stateVersion = "17.09";

}
