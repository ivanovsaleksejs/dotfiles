{ config, pkgs, ... }:

{
  imports =
    [
      ./vhosts.nix
    ];

  services = {
    nginx = {
      enable = true;
      user = "nginx";
      group = "nginx";
    };

    phpfpm = {
      extraConfig = ''
        error_log = "/run/phpfpm/php-fpm.log"
      '';
      phpOptions = ''
        cgi.fix_pathinfo = 0;
      '';
      poolConfigs.mypool = ''
        listen = /run/phpfpm/nginx
        listen.owner = nginx
        listen.group = nginx
        user = nginx
        pm = dynamic
        pm.max_children = 5
        pm.start_servers = 2
        pm.min_spare_servers = 1
        pm.max_spare_servers = 5
        pm.max_requests = 1000

        php_admin_value[error_log] = "/run/phpfpm/php-fpm.log"
        php_admin_flag[log_errors] = on
        php_value[date.timezone] = "UTC"
        php_value[upload_max_filesize] = 10G
        php_value[cgi.fix_pathinfo] = 0
      '';
    };

    redis.enable = true;
    mysql.package = pkgs.mariadb;
    mysql.enable = true;
  };
}
