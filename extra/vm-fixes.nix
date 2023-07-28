{ config, pkgs, ... } : {
    services.xserver.displayManager.sddm.enableHidpi = false;
    services.xserver.displayManager.setupCommands = ''
    ${pkgs.xorg.xrandr}/bin/xrandr -s 1920x1080
    '';
    boot.kernelParams = [
        "video=1920x1080@60"
    ];
    boot.loader.grub.gfxmodeBios = "1920x1080";
    boot.loader.grub.gfxmodeEfi = "1920x1080";
}
