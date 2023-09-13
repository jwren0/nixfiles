let
    nixpkgs = import <nixpkgs> {};

    inherit (nixpkgs) stdenv;

    name = "onedark-wallpapers";
    path = stdenv.mkDerivation {
        inherit name;

        src = builtins.fetchGit {
            url = "https://github.com/Narmis-E/${name}";
            ref = "main";
            rev = "e4f15b90ebf7d3c7cf4fb5a08a4449d2321fb732";
        };

        installPhase = ''
        mkdir -p $out/${name}

        cp -r \
            ./minimal/ \
            $out/${name}
        '';
    };

    wallpaperPath = (toString path)
        + "/${name}/minimal/od_underwater.png";
in ''
from libqtile import bar, \
                     layout, \
                     widget

from libqtile.config import Click, \
                            Drag, \
                            Group, \
                            Key, \
                            Match, \
                            Screen

from libqtile.lazy import lazy

mod = "mod4"
browser = "librewolf"
terminal = "alacritty"
screenshot = "flameshot gui"
browser_priv = f"{browser} --private-window"

groups = [Group(i) for i in "123456789"]

keys = [
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),

    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),

    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),

    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "q", lazy.shutdown(), desc="Exit Qtile"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "space", lazy.window.toggle_floating(), desc="Toggle floating mode"),

    Key(["control", "mod1"], "t", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "space", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod], "f", lazy.spawn(browser), desc="Launch browser"),
    Key([mod, "shift"], "f", lazy.spawn(browser_priv), desc="Launch private browser"),
    Key([mod], "grave", lazy.spawn(screenshot), desc="Take and copy a screenshot"),
]

for i in groups:
    name = i.name

    keys.extend([
        Key(
            [mod],
            name,
            lazy.group[name].toscreen(),
            desc=f"Switch to group {name}",
        ),
        Key(
            [mod, "shift"],
            name,
            lazy.window.togroup(name, switch_group=False),
            desc=f"Move focused window to group {name}",
        ),
    ])

layouts = [
    layout.Columns(
        margin=10,
        border_width=2,
        border_focus="#181a1f",
        border_normal="#282c34",
        border_on_single=True
    ),
]

widget_defaults = {
    "font": "hack",
    "fontsize": 16,
    "padding": 3,
}

extension_defaults = widget_defaults.copy()

top_bar = bar.Bar([
        widget.GroupBox(
            active="#ffffff",
            rounded=True,
            inactive="#707070",
            padding_x=5,
            hide_unused=True,
            urgent_text="#ffffff",
            highlight_method="block",
            this_screen_border="#535965",
            block_highlight_text_color="#ffffff",
            this_current_screen_border="#535965"
        ),
        widget.Prompt(),
        widget.Sep(padding=20, linewidth=2),
        widget.WindowName(),
        widget.Systray(),
        widget.Sep(padding=20, linewidth=2),
        widget.Clock(format="%a %d %b %Y"),
        widget.Sep(padding=20, linewidth=2),
        widget.Clock(format="%H:%M"),
    ],
    24,
    margin=[10, 10, 0, 10],
    background="#000000.0"
)

screens = [
    Screen(
        top=top_bar,
        wallpaper="${wallpaperPath}",
        wallpaper_mode="fill"
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wmname = "LG3D"
''
