{ pc, pkgs, pkgs-unstable, ... }:

{
  home.username = pc.user;
  home.homeDirectory = "/home/${pc.user}";
  home.stateVersion = "24.05"; # Don't change this.

  home.packages = [
    # Apps
    pkgs.inkscape
    pkgs.obsidian
    pkgs.vscode

    # Unstable apps
    pkgs-unstable.gearlever

    # Nix utilities
    pkgs.nixfmt-classic
    pkgs.nixd

    # Utilities
    pkgs.gnome-keyring
    pkgs.git-credential-manager
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Flat Remix";
      package = pkgs.flat-remix-gtk;
    };
    iconTheme = {
      name = "Flat Remix";
      package = pkgs.flat-remix-icon-theme;
    };
  };
 
  programs.home-manager.enable = true;
}
