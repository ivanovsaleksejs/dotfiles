{ config, pkgs, ... }:

{
  hardware ={
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [ vaapiIntel libvdpau-va-gl vaapiVdpau ];
      extraPackages32 = with pkgs.pkgsi686Linux; [ vaapiIntel libvdpau-va-gl vaapiVdpau ];
    };
  };

  console.font = "sun12x22";

  services.xserver = {
    videoDrivers = ["modesetting"];
    enable = true;
    libinput = {
      enable = true;
      touchpad = {
        scrollMethod = "edge";
        tapping = true;
      };
#      disableWhileTyping = true;
    };
    windowManager = {
      i3.enable = true;
    };
    desktopManager = {
      xfce = {
        enable = false;
        thunarPlugins = with pkgs.xfce; [
          thunar-archive-plugin
          thunar-dropbox-plugin
          thunar_volman
        ];

        noDesktop = true;
        enableXfwm = false;
      };
    };
    displayManager.defaultSession = "none+i3";
    resolutions = [
      {
        x = 1920;
        y = 1080;
      }
      {
        x = 3440;
        y = 1440;
      }
      {
        x = 2560;
        y = 1080;
      }
    ];
    virtualScreen = {
      x = 3440;
      y = 1440;
    };

    synaptics.enable = false;
    #libinput.enable = true;
    layout = "lv,ru";
    xkbModel = "microsoft";
    xkbOptions = "grp:alt_shift_toggle,grp_led:caps,caps:escape";
    xkbVariant = "winkeys";

  };
  fonts = {
  #  fontconfig.enable = true;
    fonts = with pkgs; [
      material-icons
      font-awesome-ttf
      noto-fonts-emoji
      source-code-pro
      dejavu_fonts
      liberation_ttf
      emojione
    ];
  };
}
