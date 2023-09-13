pkgs: {
    enable = true;

    iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
    };

    settings = {
        global = {
            monitor = 0;

            scale = 0;
            width = 200;
            height = 300;

            follow = "none";
            origin = "top-right";
            offset = "6x29";

            padding = 8;
            text_icon_padding = 0;
            horizontal_padding = 8;

            frame_width = 0;
            transparency = 0;
            separator_height = 2;

            font = "hack 8";
            line_height = 0;

            frame_color = "#999999";
            separator_color = "frame";

            mouse_left_click = "close_current";
            mouse_middle_click = "do_action, close_current";
            mouse_right_click = "close_all";

            icon_position = "left";
            min_icon_size = 0;
            max_icon_size = 32;

            sort = "yes";
            indicate_hidden = "yes";
            stack_duplicates = true;
            notification_limit = 5;
            show_age_threshold = 60;
            hide_duplicate_count = false;

            progress_bar = true;
            progress_bar_height = 10;
            progress_bar_frame_width = 1;
            progress_bar_min_width = 150;
            progress_bar_max_width = 300;

            format = "<b>%s</b>\\n%b";
            markup = "full";
            alignment = "left";
            ellipsize = "middle";
            ignore_newline = "no";
            show_indicators = "no";
            vertical_alignment = "center";

            sticky_history = "yes";
            history_length = 20;
        };

        urgency_low = {
            timeout = 5;
            background = "#303030";
            foreground = "#ffffff";
        };

        urgency_normal = {
            timeout = 5;
            background = "#303030";
            foreground = "#ffffff";
        };

        urgency_critical = {
            timeout = 0;
            background = "#900000";
            foreground = "#ffffff";
        };
    };
}
