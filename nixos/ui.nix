{ config, pkgs, ... }:

{
  i18n = {
     consoleFont = "sun12x22";
  };

  services.xserver = {
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
