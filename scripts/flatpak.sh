#!/usr/bin/env bash
echo "Installing flatpak programs:"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub app.zen_browser.zen
flatpak install -y flathub it.mijorus.smile