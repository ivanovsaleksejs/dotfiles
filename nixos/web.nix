{ config, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/vhosts.nix
    ];

  services = {
    nginx = {
      enable = true;
      user = "nginx";
      group = "nginx";
    };

    phpfpm = {
      settings = {
        #error_log = "/run/phpfpm/php-fpm.log";
      };
      phpOptions = ''
        cgi.fix_pathinfo = 0;
      '';
    };

    redis.enable = true;
    mysql.package = pkgs.mariadb;
    mysql.enable = true;
  };
}
