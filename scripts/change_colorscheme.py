#!/usr/bin/env python
"""
    script to change gtk theme, icon theme and neovim colorscheme

    best used with cron for automatic dark mode switching:
    `cron
        # change to light mode from 9:00 to 19:00
        *  9-19 * * * /home/gkeep/.local/bin/change_colorscheme.py light

        # change to dark mode from 20:00 to 8:00
        *   0-8 * * * /home/gkeep/.local/bin/change_colorscheme.py dark
        * 20-23 * * * /home/gkeep/.local/bin/change_colorscheme.py dark
    `

    maintainer: gkeep <gkeep@gkeep.xyz>
"""
import os
import sys
import subprocess

USER = os.getlogin()
DISABLE = False

CONFIG = {
    "gtk": True,
    "icons": True,
    "neovim": False,
}

GTK_SETTINGS = f"/home/{USER}/.config/gtk-3.0/settings.ini"


def get_current_colorscheme(return_true_val=False) -> str:
    with open(GTK_SETTINGS) as file:
        for line in file:
            if line.startswith("gtk-application-prefer-dark-theme"):
                is_dark = line.split("=")[1].strip()

    if return_true_val:
        return is_dark

    if is_dark in ["1", "true"]:
        return "dark"
    elif is_dark in ["0", "false"]:
        return "light"


def change_theme(_type, to_light=True):
    if _type in CONFIG.keys():
        if _type in ["gtk", "icons"]:
            inp_file = GTK_SETTINGS
            if _type == "gtk":
                option = "gtk-application-prefer-dark-theme"
            else:
                option = "gtk-icon-theme-name"
        elif _type == "neovim":
            inp_file = f"/home/{USER}/.config/nvim/init.vim"
            option = "background"

    if _type == "icons":
        params = ["Dark", "Light"]
    elif _type == "gtk":
        if get_current_colorscheme(return_true_val=True):
            params = ["1", "0"]
        else:
            params = ["true", "false"]

    if not to_light:
        params.reverse()

    lines = []
    with open(inp_file, "r") as in_file:
        for line in in_file:
            if line.startswith(option):
                line = line.replace(params[0], params[1])
            lines.append(line)

    with open(inp_file, "w") as out_file:
        for line in lines:
            out_file.write(line)

    print(f"changed {_type} theme")


def main():
    if DISABLE:
        return

    session = os.getenv("DESKTOP_SESSION")

    if session not in ["sway", "i3", "bspwm"]:
        return

    current_colorscheme = get_current_colorscheme()
    colorscheme = sys.argv[1]
    print("\t{} -> {}".format(current_colorscheme, colorscheme))

    if current_colorscheme == colorscheme:
        print(f"theme is already {colorscheme}")
        return

    if colorscheme.lower() == "light":
        for key in CONFIG.keys():
            if CONFIG[key]:
                change_theme(key, to_light=True)
    elif colorscheme.lower() == "dark":
        for key in CONFIG.keys():
            if CONFIG[key]:
                change_theme(key, to_light=False)

    subprocess.run(["notify-send", "-u", "low", "-t", "2000", f"Changed theme to {colorscheme}"])


if __name__ == "__main__":
    main()
