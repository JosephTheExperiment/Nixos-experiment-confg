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
    pkgs-unstable.bottles

    # Rust
    pkgs.rustc
    pkgs.cargo
    pkgs.rust-analyzer

    # C/C++
    pkgs.cmake
    pkgs.conan
    pkgs.vcpkg
    pkgs.gcc
    pkgs.gnumake
    pkgs.clang-tools

    # Gaming
    pkgs.protonup-ng

    # Nix utilities
    pkgs.nixfmt-classic
    pkgs.nixd
  ];

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.home-manager.enable = true;
}
