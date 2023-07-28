{ config, ... } : {
    virtualisation.docker.rootless = {
        enable = true;
    };
}
