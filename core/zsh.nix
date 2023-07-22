{ config, ... } : {
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;
        shellAliases = {
            # Useful aliases
            "ls" = "exa -Fg --icons --group-directories-first";
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
            "update" = "sudo nix-channel --update && sudo nixos-rebuild switch";
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
        shellInit = ''
        bindkey "\e[3~" delete-char
        bindkey "^[[1;3C" forward-word
        bindkey "^[[1;3D" backward-word
        bindkey "^[[1;5C" forward-word
        bindkey "^[[1;5D" backward-word

        function poweroff() {
            printf "Really poweroff? [y/N] "
            read opt

            if [ "$opt" = "y" ] || [ "$opt" = "Y" ]; then
                printf "Powering off...\n"
                sudo poweroff
            else
                printf "Poweroff cancelled\n"
            fi
        }

        function reboot() {
            printf "Really reboot? [y/N] "
            read opt

            if [ "$opt" = "y" ] || [ "$opt" = "Y" ]; then
                printf "Rebooting...\n"
                sudo reboot
            else
                printf "Reboot cancelled\n"
            fi
        }

        function rm() {
            trash $*
        }

        # Useful variables
        export PAGER="less"
        export EDITOR="nvim"
        export VISUAL="nvim"
        export GNUPGHOME="$HOME/.local/share/gnupg"
        export WORDCHARS="$."
        export LESSHISTFILE="/dev/null"

        # XDG variables
        export XDG_DATA_HOME="$HOME/.local/share"
        export XDG_CACHE_HOME="$HOME/.local/cache"
        export XDG_STATE_HOME="$HOME/.local/state"
        export XDG_CONFIG_HOME="$HOME/.config"

        # Coloring man pages
        export LESS_TERMCAP_md=$'\e[1;34m'
        export LESS_TERMCAP_me=$'\e[0m'
        export LESS_TERMCAP_us=$'\e[1;4;36m'
        export LESS_TERMCAP_ue=$'\e[0m'

        # Home dir fixes
        # export CARGO_HOME="$XDG_DATA_HOME/cargo"
        # export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
        # source "$CARGO_HOME/env"
        '';
    };
}
