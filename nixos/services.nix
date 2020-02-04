# List of services and settings
{ config, pkgs, lib, ... }:

{

  services = {
    printing = {
      enable = true;
      drivers  = [
        pkgs.gutenprint
        pkgs.gutenprintBin
        pkgs.splix
        pkgs.hplip
        pkgs.hplipWithPlugin
      ];
    };

    avahi = {
      enable = true;
      nssmdns = true;
      hostName = "nixos";
      #cacheEntriesMax = 0;
      publish = {
        addresses = true;
        domain = true;
        enable = true;
        workstation = true;
        };
      #reflector = true;
    };

    phpfpm.pools.mypool = {
      user = "nginx";
      settings = {
        "listen.owner" = config.services.nginx.user;
        "pm" = "dynamic";
        "pm.max_children" = 32;
        "pm.max_requests" = 500;
        "pm.start_servers" = 2;
        "pm.min_spare_servers" = 2;
        "pm.max_spare_servers" = 5;
        "php_admin_value[error_log]" = "stderr";
        "php_admin_flag[log_errors]" = true;
        "catch_workers_output" = true;
      };
      phpEnv."PATH" = lib.makeBinPath [ pkgs.php ];
    };

    #teamviewer.enable = true;

    logind = {
      lidSwitch = "suspend";
      extraConfig = ''
        HandleLidSwitch=suspend
        HandlePowerKey=ignore
      '';
    };

    postgresql.enable = true;

    mongodb.enable = true;

    #saned = {
      #  enable = true;
      #extraConfig = "192.168.1.8/24";
      #};
  };
}
