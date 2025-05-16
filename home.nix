{ pc, pkgs, pkgs-unstable, ... }:

{
  home.username = pc.user;
  home.homeDirectory = "/home/${pc.user}";
  home.stateVersion = "24.05"; # Don't change this.

  home.packages = [
    # Apps
    pkgs.inkscape
    pkgs.obsidian
    pkgs.lapce
    
    # Unstable apps
    pkgs-unstable.gearlever

    # Nix utilities
    pkgs.nixfmt-classic
    pkgs.nixd

    # Utilities
    pkgs.git-credential-manager
  ];
 
  programs.home-manager.enable = true;
}
