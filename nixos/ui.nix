{ config, pkgs, ... }:

{
  hardware ={
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [ vaapiIntel libvdpau-va-gl vaapiVdpau ];
      extraPackages32 = with pkgs.pkgsi686Linux; [ vaapiIntel libvdpau-va-gl vaapiVdpau ];
      s3tcSupport = true;
    };
  };

  i18n = {
     consoleFont = "sun12x22";
  };

  services.xserver = {
    videoDrivers = [ "mesa" ];
    enable = true;
    windowManager = {
      i3.enable = true;
      default = "i3";
    };
    resolutions = [
      {
        x = 1920;
        y = 1080;
      }
    ];
    virtualScreen = {
      x = 1920;
      y = 1080;
    };

    synaptics.enable = true;
    layout = "lv,ru";
    xkbModel = "microsoft";
    xkbOptions = "grp:alt_shift_toggle,grp_led:caps";
    xkbVariant = "winkeys";

  };
  fonts = {
    fontconfig.enable = true;
    fonts = with pkgs; [
      material-icons
      font-awesome-ttf
      noto-fonts-cjk
      noto-fonts-emoji
      noto-fonts
      source-code-pro
      source-sans-pro
    ];
  };
}
