{ pkgs, ... }: {
  # System wide packages
  environment.systemPackages = [
    pkgs.uutils-coreutils-noprefix
    pkgs.p7zip
    pkgs.home-manager

    # Xfce4 plugins
    pkgs.xfce.xfce4-docklike-plugin
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

  # Enable fish
  programs.fish.enable = true;

  # Options for games
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
}
