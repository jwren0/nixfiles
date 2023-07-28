{ pkgs, ... } : {
    services.picom = {
        enable = true;
    };

    services.xserver = {
        enable = true;
        layout = "us";
        windowManager.qtile = {
            enable = true;
            backend = "x11";
            configFile = (import <nixpkgs> {}).writeTextFile {
                name = "qtile.py";
                text = import ./qtile-config.nix pkgs;
            };
        };
    };

    sound.mediaKeys = {
        enable = true;
        volumeStep = "5%";
    };
}
