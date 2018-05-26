# List of services and settings
{ config, pkgs, ... }:

{
  
  services = {
    printing = {
      enable = true;
      drivers  = [
        pkgs.gutenprint
        pkgs.gutenprintBin
        pkgs.splix
      ];
    };
    avahi = {
      enable = true;
      nssmdns = true;
      allowPointToPoint = true;
    };

    teamviewer.enable = true;

    logind = {
      lidSwitch = "suspend";
      extraConfig = ''
        HandlePowerKey=ignore
      '';
    };

    saned = {
      enable = true;
      extraConfig = "192.168.1.0/24";
    };
  };
}
