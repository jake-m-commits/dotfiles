#!/usr/bin/env bash
sudo xbps-install -S python3 python3-pip python3-setuptools python3-wheel python3-virtualenv-clone python3-dbus python3-gobject pango pango-devel libffi-devel xcb-util-cursor gdk-pixbuf -y
pip install xcffib
pip install --no-cache-dir cairocffi
pip install qtile

# lib dependencies and testing
pip install psutil
pip install mypy
