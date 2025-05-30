{ pkgs, ... }: {
  # System wide packages
  environment.systemPackages = [
    pkgs.uutils-coreutils-noprefix
    pkgs.home-manager

    # Xfce4 plugins
    pkgs.xfce.xfce4-docklike-plugin
    pkgs.xfce.xfce4-clipman-plugin
    pkgs.xfce.xfce4-xkb-plugin
  ];

  # Enable thunar-archive-plugin
  programs.thunar.plugins = [ pkgs.xfce.thunar-archive-plugin ];

  # Enable linking via nix-ld module
  programs.nix-ld = {
    enable = true;
    libraries = [ ];
  };

  # Enable appimage support
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # Enable flatpak and xdg portal
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Enable gnome-keyring for git
  services.gnome.gnome-keyring.enable = true;

  # Enable zsh
  programs.fish.enable = true;

  # Fonts
  fonts.packages = [
    pkgs.nerd-fonts.fira-code
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.nerd-fonts.terminess-ttf
  ];
}
