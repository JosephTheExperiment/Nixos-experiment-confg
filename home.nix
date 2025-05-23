{ pc, lib, pkgs, pkgs-unstable, ... }: {
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

    # Utils
    pkgs.manix
  ];

  programs.home-manager.enable = true;
}
