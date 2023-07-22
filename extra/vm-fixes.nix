{ config, pkgs, ... } : {
    services.xserver.displayManager.setupCommands = ''
    ${pkgs.xorg.xrandr}/bin/xrandr -s 1920x1080
    '';
}
