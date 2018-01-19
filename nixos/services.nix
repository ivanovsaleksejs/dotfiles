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

    logind.extraConfig = ''
      HandlePowerKey=ignore
    '';
  };
}
