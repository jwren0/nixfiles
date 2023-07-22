{ config, pkgs, ... } : {
    services.picom = {
        enable = true;
    };

    services.xserver = {
        enable = true;
        layout = "us";
        windowManager.qtile = {
            enable = true;
            backend = "x11";
            configFile = ./qtile.py;
        };
    };
}
