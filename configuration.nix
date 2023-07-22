let
    _baseImports = [
        ./hardware-configuration.nix

        ./core/boot.nix
        ./core/documentation.nix
        ./core/fonts.nix
        ./core/zsh.nix
    ];
    _basePackages = import ./core/packages.nix;
    _customPackages = if builtins.pathExists ./custom/packages.nix then import ./custom/packages.nix else { ... } : [];
in
{ config, pkgs, ... } : {
    imports = if builtins.pathExists ./custom/custom.nix then _baseImports ++ [
        ./custom/custom.nix
    ] else _baseImports;

    environment.systemPackages = (_basePackages pkgs) ++ (_customPackages pkgs);

    nix.extraOptions = ''
    experimental-features = nix-command flakes
    '';

    programs.command-not-found.enable = false;

    system = {
        copySystemConfiguration = true;
        stateVersion = "23.05";
    };
}
