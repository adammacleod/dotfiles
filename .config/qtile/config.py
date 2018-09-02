# Adam's QTile configuration - based on the official configuration file.

import os
import subprocess

from libqtile.config import EzKey as Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook

# runs only once (ie, not on lazy.restart()
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

try:
    from typing import List  # noqa: F401
except ImportError:
    pass

keys = [
    # Switch between windows in current stack pane
    Key("M-j", lazy.layout.down()),
    Key("M-k", lazy.layout.up()),
    Key("M-h", lazy.layout.left()),
    Key("M-l", lazy.layout.right()),

    # Move windows up or down in current stack
    Key("M-S-j", lazy.layout.shuffle_down()),
    Key("M-S-k", lazy.layout.shuffle_up()),
    Key("M-S-h", lazy.layout.shuffle_left()),
    Key("M-S-l", lazy.layout.shuffle_right()),
    
    Key("M-C-j", lazy.layout.grow_down()),
    Key("M-C-k", lazy.layout.grow_up()),
    Key("M-C-h", lazy.layout.grow_left()),
    Key("M-C-l", lazy.layout.grow_right()),
    
    Key("M-S-<Return>", lazy.layout.toggle_split()),
    Key("M-n", lazy.layout.normalize()),

    # Switch window focus to other pane(s) of stack
    Key("M-<Tab>", lazy.layout.next()),
    Key("M-z", lazy.next_screen()),

    # Swap panes of split stack
    Key("M-S-<Tab>", lazy.layout.rotate()),

    # Toggle between different layouts as defined below
    Key("M-m", lazy.next_layout()),
    Key("M-w", lazy.window.kill()),

    # Restart qtile (Reload config)
    Key("M-C-r", lazy.restart()),

    # Logout/quit qtile
    Key("M-C-q", lazy.shutdown()),
    
    # Command launchers
    Key("M-<space>", lazy.spawncmd()),
    Key("M-<Return>", lazy.spawn("urxvt")),
    Key("M-f", lazy.spawn("firefox")),
]

groups = [Group(i) for i in ['web','code','term','4','5','6','7','music','chat']]

for i, g in enumerate(groups):
    keys.extend([
        # mod1 + letter of group = switch to group
        Key("M-{}".format(i+1), lazy.group[g.name].toscreen()),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key("M-S-{}".format(i+1), lazy.window.togroup(g.name)),
    ])

layouts = [
    layout.Columns(
        border_width=1,
        border_focus='#5F8183',
        border_normal='#041413'),
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

def bar_config():
    return bar.Bar(
        [
            widget.GroupBox(
                borderwidth=3,
                center_aligned=True,
                highlight_method='line',
                highlight_color=['00AA00','111111'],
                other_current_screen_border='AA0000',
                other_screen_border='AA0000',
                this_current_screen_border='00AA00',
                this_screen_border='00AA00',
                inactive='AAAAAA',
            ),
            widget.Prompt(),
            widget.WindowName(),
            widget.Systray(),
            widget.Clock(format='%a %d/%m %I:%M %p'),
        ],
        24, 
        background='#040C0C'
    )

screens = [
    Screen(bottom=bar_config()),
    Screen(bottom=bar_config()),
]

# Drag floating layouts.
mouse = [
    Drag(["mod4"], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag(["mod4"], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click(["mod4"], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, github issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

