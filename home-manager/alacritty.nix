{
    enable = true;
    settings = {
        # Colors (One Dark Darker)
        # See: https://github.com/navarasu/onedark.nvim
        colors = {
            primary = {
                background = "#1f2329";
                foreground = "#a0a8b7";
            };

            normal = {
                black      = "#0e1013";
                red        = "#e55561";
                green      = "#8ebd6b";
                yellow     = "#e2b86b";
                blue       = "#4fa6ed";
                magenta    = "#bf68d9";
                cyan       = "#48b0bd";
                white      = "#a0a8b7";
            };


            bright = {
                black      = "#5c6370";
                red        = "#8b3434";
                green      = "#8ebd6b";
                yellow     = "#835d1a";
                blue       = "#4fa6ed";
                magenta    = "#7e3992";
                cyan       = "#266269";
                white      = "#a0a8b7";
            };
        };

        env = {
          TERM = "xterm-256color";
        };

        font = {
            size = 9.0;
            normal = {
                family = "hack";
            };
        };

        cursor = {
            style = {
                shape = "Beam";
                blinking = "on";
            };
        };

        window = {
            opacity = 0.9;
        };
    };
}
