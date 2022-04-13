# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    if builtins.getEnv "target" == "VM"
    then
    [
      #./hardware-configuration.nix
      ./services_vm.nix
      ./bashrc.nix
      ./packages_vm.nix
      ./ui.nix
      #./web.nix
      #./sane-extra-config.nix
      ./users.nix
      ./vm.nix
    ]
    else
    [
      /etc/nixos/hardware-configuration.nix
      /etc/nixos/users.nix
      /etc/nixos/services.nix
      /etc/nixos/bashrc.nix
      /etc/nixos/packages.nix
      /etc/nixos/ui.nix
      /etc/nixos/web.nix
      /etc/nixos/sane-extra-config.nix
      /etc/nixos/cron.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    grub.gfxmodeEfi = "1024x576";
  };

  #boot.kernelModules = [ "nf_conntrack_pptp" ];

  #boot.kernel.sysctl."net.ipv6.conf.wlp1s0.disable_ipv6" = true;

  #boot.extraModulePackages = [ config.boot.kernelPackages.wireguard ];

  networking = {
    networkmanager = {
      enable = true;
      enableStrongSwan = true;
    };
    firewall = {
      #autoLoadConntrackHelpers = true;
      #connectionTrackingModules = [ "pptp" ];
      allowedTCPPorts = [ 25 80 443 1080 3000 5353 6881 8081 8881 9000 9060 9100 ];
    };
    #nameservers = [ "192.168.0.1" "8.8.8.8" "9.9.9.9" ];
  };

  hardware = {
    bluetooth.enable = true;
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
      support32Bit = true;
    };
    sane = {
      enable = true;
      extraBackends = [ pkgs.sane-airscan pkgs.hplipWithPlugin ];
      #netConf = "192.168.1.8";
    };
  };
  virtualisation = {
    virtualbox.host.enable = true;
    docker.enable = true;
  };
  users.extraGroups.vboxusers.members = [ "aleksejs" ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  time.timeZone = "Europe/Riga";

  system = {
    #nssHosts = [ "mdns" ];
    autoUpgrade = {
      enable = false;
    };
  };
  #users.users.aleksejs.extraGroups = [ "scanner" "lp" ];
  nixpkgs.config.allowUnfree = true;

}
