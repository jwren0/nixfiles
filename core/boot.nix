{ config, ... } : {
    boot.loader = {
        systemd-boot.enable = false;
        efi.canTouchEfiVariables = true;
        grub = {
            enable = true;
            device = "nodev";
            efiSupport = true;
            extraGrubInstallArgs = [
                "--efi-directory=/boot/efi"
                "--boot-directory=/boot"
            ];
        };
    };
}
