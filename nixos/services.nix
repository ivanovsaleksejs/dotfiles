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

    blueman = {
      enable = true;
    };

    phpfpm.phpOptions = ''
      zend_extension=${pkgs.php73Extensions.xdebug}/lib/php/extensions/xdebug.so
      extension=${pkgs.php74Extensions.pdo_dblib}/lib/php/extensions/pdo_dblib.so
      max_execution_time = 0
      memory_limit = 2G
      xdebug.remote_autostart=on
      xdebug.remote_enable=on
      xdebug.remote_mode=req
      xdebug.remote_handler=dbgp
      xdebug.remote_host=localhost
      xdebug.remote_port=9000
    '';

    phpfpm.pools = {
      mypool = {
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
        phpOptions = ''
          extension=${pkgs.php74Extensions.pdo}/lib/php/extensions/pdo.so
          extension=${pkgs.php74Extensions.pdo_dblib}/lib/php/extensions/pdo_dblib.so
        '';
      };
      oldpool = {
        user = "nginx";
        phpPackage = pkgs.php73;
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
        phpOptions = ''
          extension=${pkgs.php74Extensions.pdo}/lib/php/extensions/pdo.so
          extension=${pkgs.php74Extensions.pdo_dblib}/lib/php/extensions/pdo_dblib.so
        '';
      };
    };

    teamviewer.enable = true;

    logind = {
      lidSwitch = "suspend";
      extraConfig = ''
        HandleLidSwitch=suspend
        HandlePowerKey=ignore
      '';
    };

    fprintd.enable = true;


    postgresql.enable = true;

    postfix ={
      enable = true;
      extraConfig = ''
        inet_protocols = ipv4
      '';
    };

    mongodb.enable = true;

    gnome.gnome-keyring.enable = true;

    saned = {
      enable = true;
    };
  };

  security.pam.services = {
    login.fprintAuth = true;
    xscreensaver.fprintAuth = true;
  };
}
