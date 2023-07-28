{ pkgs, ... } : {
    services.picom = {
        enable = true;
    };

    services.xserver = {
        enable = true;
        layout = "us";
        displayManager.sddm = let
            nixpkgs = import <nixpkgs> {};

            inherit (nixpkgs) stdenv;

            name = "sddm-chili";
            version = "0.1.5";
            themePath = stdenv.mkDerivation {
                inherit name;
                src = builtins.fetchTarball {
                    url = "https://github.com/MarianArlt/${name}/archive/refs/tags/${version}.tar.gz";
                    sha256 = "036fxsa7m8ymmp3p40z671z163y6fcsa9a641lrxdrw225ssq5f3";
                };
                buildPhase = ''
                chmod -x \
                    ./Main.qml \
                    ./assets/background.jpg
                '';
                installPhase = ''
                mkdir -p $out/${name}

                cp -r \
                    ./assets/ \
                    ./components/ \
                    ./Main.qml \
                    ./theme.conf \
                    $out/${name}
                '';
            };
        in {
            enable = true;
            settings = {
                Theme = {
                    ThemeDir = toString themePath;
                    Current = name;
                };
            };
        };
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
