{ pkgs, ... } : {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    autocd = true;
    defaultKeymap = "emacs";
    dotDir = ".config/zsh";

    history.path = "$ZDOTDIR/zsh_history";

    initExtra = ''
    setopt nomatch
    setopt prompt_subst

    zstyle ":vcs_info:*" check-for-changes true
    zstyle ":vcs_info:*" get-unapplied true
    zstyle ":vcs_info:*" unstagedstr " %F{yellow}+%F{green}"
    zstyle ":vcs_info:*" stagedstr " %F{yellow}+%F{green}"
    zstyle ":vcs_info:git:*" formats " %F{green}(%b%u%c)%f"
    zstyle ":vcs_info:git:*" actionformats " %F{green}(%b|%a%u%c)%f"

    autoload -Uz add-zsh-hook vcs_info
    add-zsh-hook precmd vcs_info

    PROMPT="%n%F{green}@%m%f\$vcs_info_msg_0_ %1~%F{green}>%f "

    bindkey "\e[3~" delete-char
    bindkey "^[[1;3C" forward-word
    bindkey "^[[1;3D" backward-word
    bindkey "^[[1;5C" forward-word
    bindkey "^[[1;5D" backward-word

    digest() {
        md5sum $@ \
            && sha1sum $@ \
            && sha256sum $@ \
            && sha512sum $@
    }

    poweroff() {
        printf "Really poweroff? [y/N] "
        read opt

        if [ "$opt" = "y" ] || [ "$opt" = "Y" ]; then
            printf "Powering off...\n"
            sudo poweroff
        else
            printf "Poweroff cancelled\n"
        fi
    }

    reboot() {
        printf "Really reboot? [y/N] "
        read opt

        if [ "$opt" = "y" ] || [ "$opt" = "Y" ]; then
            printf "Rebooting...\n"
            sudo reboot
        else
            printf "Reboot cancelled\n"
        fi
    }

    rm() {
        for _f in $@; do
            ${pkgs.trash-cli}/bin/trash $_f
        done

        unset _f
    }

    objdump() {
        if [ $# -lt 1 ]; then
            ${pkgs.binutils}/bin/objdump --help
        else
            ${pkgs.binutils}/bin/objdump \
                -D -M intel \
                --visualize-jumps=color \
                --disassembler-color=on \
                $@ | ${pkgs.most}/bin/most
        fi
    }

    unalias l

    export PATH="$PATH:$CARGO_HOME/bin"
    export PATH="$RUSTUP_HOME/toolchains/stable-x86_64-unknown-linux-gnu/bin:$PATH"
    '';

    sessionVariables = let
        less = "${pkgs.less}/bin/less";
        nvim = "${pkgs.neovim}/bin/nvim";
    in {
        PAGER = less;
        EDITOR = nvim;
        VISUAL = nvim;
        LYNX_CFG = "$HOME/.config/lynx/lynx.cfg";
        LYNX_LSS = "$HOME/.config/lynx/lynx.lss";
        WORDCHARS = "$.";
        LESSHISTFILE = "/dev/null";
        LESS_TERMCAP_md = "$(printf \"\\e[1;34m\")";
        LESS_TERMCAP_me = "$(printf \"\\e[0m\")";
        LESS_TERMCAP_us = "$(printf \"\\e[1;4;36m\")";
        LESS_TERMCAP_ue = "$(printf \"\\e[0m\")";
        CARGO_HOME = "$HOME/.local/share/cargo";
        RUSTUP_HOME = "$HOME/.local/share/rustup";
        DOCKER_HOST = "unix://$XDG_RUNTIME_DIR/docker.sock";
        DOCKER_BUILDKIT = "0";
        DOCKER_CONTENT_TRUST = "1";
    };

    shellAliases = {
        "ls" = "eza -Fg --icons --group-directories-first --git";
        "la" = "ls -la";
        "ll" = "ls -l";
        "al" = "la";
        "sl" = "ls";
        "ip" = "ip -c";
        "bat" = "bat --theme OneHalfDark";
        "cal" = "cal -m";
        "cd.." = "cd ..";
        "diff" = "diff -u --color=auto";
        "less" = "less -RF";
        "open" = "mimeopen";
        "pman" = "MANPAGER=zathura man -T pdf";
        "tree" = "tree -CF --dirsfirst";
        "python" = "bpython";
        "update" = "sudo nix-channel --update && sudo nixos-rebuild switch";
        "docker" = "docker --config=\"$HOME/.local/state/docker\"";
        "ncmpcpp" = "ncmpcpp -q";
        "shutdown" = "poweroff";

        # Directory aliases
        "gdir" = "cd $HOME/Documents/Programming/Git";
        "ldir" = "cd $HOME/Documents/Programming/Local";
        "pdir" = "cd $HOME/Documents/Programming";

        # Safer aliases
        "cp" = "cp -i";
        "ln" = "ln -i";
        "mv" = "mv -i";
    };
}
