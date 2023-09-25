user: {
    enable = true;
    homedir = "${user.home}/.local/share/gnupg";
    settings = {
        no-greeting = true;
        photo-viewer = "sxiv %i";

        armor = true;
        expert = true;
        require-secmem = true;
        min-rsa-length = "4096";

        personal-cipher-preferences = [
            "AES256"
            "AES192"
            "AES128"
            "TWOFISH"
        ];
        personal-digest-preferences = [
            "SHA512"
            "SHA384"
            "SHA256"
            "SHA224"
            "RIPEMD160"
        ];
        personal-compress-preferences = [
            "BZIP2"
            "ZIP"
            "Uncompressed"
        ];

        s2k-cipher-algo = "AES256";
        s2k-digest-algo = "SHA512";

        disable-cipher-algo = [
            "IDEA"
            "3DES"
            "BLOWFISH"
        ];

        disable-pubkey-algo = [
            "ELG"
            "DSA"
        ];

        weak-digest = [
            "SHA1"
        ];
    };
}
