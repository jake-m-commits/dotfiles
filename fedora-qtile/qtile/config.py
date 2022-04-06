import os.path
from typing import List
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from subprocess import call as subcall

mod = "mod4"
local = "Langley"
terminal = "kitty"
home_dir = os.path.expanduser("~")
# x11 launcher
launcher = "rofi -modi drun,run -show drun -show-icons -font 'FiraCode Nerd Font 12'"
# wayland launcher
# launcher = "wofi -Gbif -S drun,run -p '\[^-^]/'"

keys = [
    Key(
        [mod], "h",
        lazy.layout.left(),
        desc="Move focus to left"
        ),
    Key(
        [mod], "l",
        lazy.layout.right(),
        desc="Move focus to right"
        ),
    Key(
        [mod], "j",
        lazy.layout.down(),
        desc="Move focus down"
        ),
    Key(
        [mod], "k",
        lazy.layout.up(),
        desc="Move focus up"
        ),
    Key(
        [mod], "space",
        lazy.layout.next(),
        desc="Move window focus to other window"
        ),
    Key(
        [mod, "shift"], "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left"
        ),
    Key(
        [mod, "shift"], "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
        ),
    Key(
        [mod, "shift"], "j",
        lazy.layout.shuffle_down(),
        desc="Move window down"
        ),
    Key(
        [mod, "shift"], "k",
        lazy.layout.shuffle_up(),
        desc="Move window up"
        ),
    Key(
        [mod, "control"], "h",
        lazy.layout.grow_left(),
        desc="Grow window to the left"
        ),
    Key(
        [mod, "control"], "l",
        lazy.layout.grow_right(),
        desc="Grow window to the right"
        ),
    Key(
        [mod, "control"], "j",
        lazy.layout.grow_down(),
        desc="Grow window down"
        ),
    Key(
        [mod, "control"], "k",
        lazy.layout.grow_up(),
        desc="Grow window up"
        ),
    Key(
        [mod], "n",
        lazy.layout.normalize(),
        desc="Reset all window sizes"
        ),
    Key(
        [mod, "shift"], "Return",
        lazy.spawn("alacritty"),
        desc="Launch alacritty",
        ),
    Key(
        [mod], "Return",
        lazy.spawn(terminal),
        desc="Launch kitty"
        ),
    Key(
        [mod], "Tab",
        lazy.next_layout(),
        desc="Toggle between layouts"
        ),
    Key(
        [mod], "w",
        lazy.window.kill(),
        desc="Kill focused window"
        ),
    Key(
        [mod, "control"], "r",
        lazy.restart(),
        desc="Restart Qtile"
        ),
    Key(
        [mod, "control"], "q",
        lazy.shutdown(),
        desc="Shutdown Qtile"
        ),
    Key(
        [mod], "r",
        lazy.spawn(launcher),
        desc="Launch rofi"
        ),
    Key(
        [mod, "shift"], "s",
        lazy.spawn(f"import -silent {home_dir}/Pictures/scrnshots/cropped.png"),
        desc="Cropped Screenshot",
        ),
    Key(
        [mod], "s",
        lazy.spawn(f"import -silent -window root {home_dir}/Pictures/scrnshots/full.png"),
        desc="Full screenshot",
        ),
    Key(
        [mod], "t",
        lazy.spawn(f"nitrogen --random --set-scaled {home_dir}/Pictures/walls/"),
        desc="Change wallpaper",
        ),
]

groups = [
    Group("1", label=""),
    Group("2", label=""),
    Group("3", label=""),
    Group("4", label=""),
    Group("5", label=""),
    Group("6", label=""),
    Group("7", label=""),
    Group("8", label=""),
    Group("9", label=""),
]

for i in groups:
    keys.extend(
        [
            Key(
                [mod], i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
                ),
            Key(
                [mod, "shift"], i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
                ),
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)
            # ),
        ]
    )

layouts = [
    layout.Columns(
        margin=5,
        border_width=1,
        border_on_single=True,
        border_focus="#98971a",
        border_normal="#000000"
        ),
    layout.TreeTab(
        font="FiraCode Nerd Font",
        fontsize=12,
        active_fg="#d79921",
        active_bg="#504945",
        inactive_fg="#a49882",
        inactive_bg="00000000",
        bg_color="#000000b3",
        sections=["Main"],
        section_top=10,
        section_fg="#a49882",
        section_fontsize=14,
        panel_width=200
        ),
    # layout.Bsp(
    #     margin=5,
    #     border_width=3,
    #     border_focus='#98971a'
    #     ),
    # layout.Zoomy(),
    # layout.Max(),
    # layout.Stack(num_stacks=2),
    # layout.Matrix(border_width=3,margin=5),
    # layout.MonadTall(),
    # layout.MonadWide(margin=5),
    # layout.RatioTile(fancy=True, border_width=3, margin=5),
    # layout.Tile(border_width=3, margin=5),
    # layout.VerticalTile(margin=5),
]

colors = dict(
    red="#cc241d",
    blue="#458588",
    green="#98971a",
    yellow="#d79921",
    aqua="#689d6a",
    white="#ebdbb2",
    black="#1d2021",
)

widget_defaults = dict(
    # font="FiraCode Nerd Font",
    font="mononoki NF",
    fontsize=12,
    foreground="#d4be98",
    padding=0,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Gap(3),
        bottom=bar.Gap(3),
        left=bar.Gap(3),
        right=bar.Gap(3),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.TextBox("   "),
                widget.TextBox(
                    # " ",
                    " ",
                    foreground=colors["blue"],
                    fontsize=18,
                    font="FiraCode Nerd Font",
                    # background=colors["black"],
                    ),
                widget.TextBox(
                    text="|",
                    foreground=colors["black"],
                    # background=colors[0],
                    font="FiraCode Nerd Font",
                    fontsize=24,
                    padding=0,
                    ),
                widget.GroupBox(
                    # block_highlight_text_color=colors["black"],
                    this_current_screen_border=colors["aqua"],
                    inactive=colors['black'],
                    active=colors["blue"],
                    highlight_method="text",
                    highlight_color=colors["aqua"],
                    urgent_alert_method="text",
                    urgent_text=colors["yellow"],
                    fontsize=14,
                    spacing=10,
                    ),
                widget.TextBox(
                    text="|",
                    foreground=colors["black"],
                    # background=colors[0],
                    font="FiraCode Nerd Font",
                    fontsize=24,
                    padding=0,
                    ),

                widget.Spacer(),
                # widget.TextBox(" "),
                # widget.WindowName(format="{name}", max_chars=100),
                widget.TextBox(
                    text="|",
                    foreground=colors["black"],
                    # background=colors[0],
                    font="FiraCode Nerd Font",
                    fontsize=24,
                    padding=0,
                    ),
                widget.TextBox("   ",font='FiraCode Nerd Font', fontsize=16),
                widget.Clock(format="%a %d ~ %H:%M ", fontsize=18),
                widget.TextBox(
                    text="|",
                    foreground=colors["black"],
                    # background=colors[0],
                    font="FiraCode Nerd Font",
                    fontsize=24,
                    padding=0,
                    ),
                widget.Spacer(),
                widget.TextBox(
                    text="|",
                    foreground=colors["black"],
                    # background=colors[0],
                    font="FiraCode Nerd Font",
                    fontsize=24,
                    padding=0,
                    ),
                widget.Systray(background="#000000b3"),
                widget.TextBox(
                    text="|",
                    foreground=colors["black"],
                    # background=colors[0],
                    font="FiraCode Nerd Font",
                    fontsize=24,
                    padding=0,
                    ),

                widget.TextBox(" "),
                widget.TextBox(
                    text="|",
                    foreground=colors["black"],
                    # background=colors[0],
                    font="FiraCode Nerd Font",
                    fontsize=24,
                    padding=0,
                    ),
                widget.TextBox(
                    " ",
                    fontsize=18,
                    font="FiraCode Nerd Font",
                    # background=colors["black"],
                    foreground=colors["red"],
                    ),
                widget.CPU(
                    # font="FiraCode Nerd Font",
                    format="{load_percent}%",
                    # background=colors["black"],
                    foreground=colors["red"],
                    update_interval=2,
                    ),
                widget.TextBox(
                    text="|",
                    foreground=colors["black"],
                    # background=colors[0],
                    font="FiraCode Nerd Font",
                    fontsize=24,
                    padding=0,
                    ),
                widget.TextBox(" "),
                widget.TextBox(
                    text="|",
                    foreground=colors["black"],
                    # background=colors[0],
                    font="FiraCode Nerd Font",
                    fontsize=24,
                    padding=0,
                    ),
                widget.TextBox(
                    " ",
                    fontsize=18,
                    # background=colors["black"],
                    foreground=colors["white"],
                    ),
                widget.ThermalSensor(
                    # font="FiraCode Nerd Font",
                    # background=colors["black"],
                    foreground=colors["white"],
                    foreground_alert=colors["red"],
                    tag_sensor="Package id 0",
                    show_tag=False,
                    metric=True,
                    update_interval=2,
                    ),
                widget.TextBox(
                    text="|",
                    foreground=colors["black"],
                    # background=colors[0],
                    font="FiraCode Nerd Font",
                    fontsize=24,
                    padding=0,
                    ),
                widget.TextBox(" "),
                widget.TextBox(
                    text="|",
                    foreground=colors["black"],
                    # background=colors[0],
                    font="FiraCode Nerd Font",
                    fontsize=24,
                    padding=0,
                    ),
                widget.TextBox(
                    " ",
                    fontsize=16,
                    font="FiraCode Nerd Font",
                    # background=colors["black"],
                    foreground=colors["green"],
                    ),
                widget.Memory(
                    format="{MemUsed: .0f} MB",
                    # background=colors["black"],
                    foreground=colors["green"],
                    ),
                widget.TextBox(
                    text="|",
                    foreground=colors["black"],
                    # background=colors[0],
                    font="FiraCode Nerd Font",
                    fontsize=24,
                    padding=0,
                    ),
                widget.TextBox(" "),
                widget.TextBox(
                    text="|",
                    foreground=colors["black"],
                    # background=colors[0],
                    font="FiraCode Nerd Font",
                    fontsize=24,
                    padding=0,
                    ),
                widget.TextBox(
                    " ",
                    fontsize=18,
                    font="FiraCode Nerd Font",
                    # background=colors["black"],
                    foreground=colors["yellow"],
                    ),
                widget.Volume(foreground=colors["yellow"]),
                widget.TextBox(
                    text="|",
                    foreground=colors["black"],
                    # background=colors[0],
                    font="FiraCode Nerd Font",
                    fontsize=24,
                    padding=0,
                    ),
                widget.TextBox(" "),
                # widget.TextBox(
                #     text="|",
                #     foreground=colors["black"],
                #     # background=colors[0],
                #     font="FiraCode Nerd Font",
                #     fontsize=24,
                #     padding=0,
                #     ),
                # widget.Wttr(
                #     location={local: local},
                #     font="FiraCode Nerd Font",
                #     ),
                # widget.TextBox(
                #     text="|",
                #     foreground=colors["black"],
                #     # background=colors[0],
                #     font="FiraCode Nerd Font",
                #     fontsize=24,
                #     padding=0,
                #     ),
                widget.TextBox("  "),
            ],
            25,
            # margin=[8,300,0,300],
            margin=[8,8,0,8],
            # opacity=1,
            # background="#32302f",
            background="#000000b3",
        ),
        bottom=bar.Gap(3),
        left=bar.Gap(3),
        right=bar.Gap(3),
    ),
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod], "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size()
    ),
    Click(
        [mod], "Button2",
        lazy.window.bring_to_front()
    ),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        # Match(wm_class='pcmanfm'),  # Thunar file browser
        # Match(wm_class='nautilus'),  # Thunar file browser
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"


# startup apps
@hook.subscribe.startup
def afterstart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subcall([home])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
