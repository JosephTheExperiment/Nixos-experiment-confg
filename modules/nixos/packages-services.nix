{ pkgs, ... }: {
  # System wide packages
  environment.systemPackages = [
    pkgs.home-manager

    # Xfce4 plugins
    pkgs.xfce.xfce4-docklike-plugin
    pkgs.xfce.xfce4-clipman-plugin
    pkgs.xfce.xfce4-xkb-plugin
  ];

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
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Fonts
  fonts.packages =
    [ pkgs.nerdfonts pkgs.noto-fonts pkgs.dejavu_fonts pkgs.font-awesome ];
}
