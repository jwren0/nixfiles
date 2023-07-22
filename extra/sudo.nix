{ config, pkgs, ... } : {
    security.sudo = {
        enable = true;
        execWheelOnly = true;
        extraConfig = ''
        Defaults env_reset,editor=${pkgs.neovim}/bin/nvim,pwfeedback
        %wheel ALL=(ALL:ALL) NOPASSWD: /run/current-system/sw/bin/poweroff,/run/current-system/sw/bin/reboot 
        '';
    };
}
