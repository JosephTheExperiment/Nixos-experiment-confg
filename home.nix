{ pc, pkgs, pkgs-unstable, ... }: {
  home.username = pc.user;
  home.homeDirectory = "/home/${pc.user}";
  home.stateVersion = "24.05"; # Don't change this.

  home.packages = [
    # Apps
    pkgs.inkscape
    pkgs.obsidian

    # Unstable apps
    pkgs-unstable.gearlever
  ];

  programs.home-manager.enable = true;
}
