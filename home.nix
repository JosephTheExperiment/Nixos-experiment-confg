{ config, pkgs, pkgs-unstable, ... }:

{
  home.username = "joseph";
  home.homeDirectory = "/home/joseph";
  home.stateVersion = "24.05"; # Don't change this.

  home.packages = [
    # Apps
    pkgs.inkscape
    pkgs.obsidian
    pkgs.vscode

    # Unstable apps
    pkgs-unstable.gearlever

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
    pkgs.protonup

    # Utilities
    pkgs.nixfmt-classic
    pkgs.nixd
  ];

  home.file = { };

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "/${HOME}/.steam/root/compatibilitytools.d";
  };

  # Git config
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userEmail = "yousef.hisham444@proton.me";
    userName = "JosephTheExperiment";
    extraConfig = {
      credential = {
        helper = "manager";
        credentialStore = "secretservice";
      };
    };
  };

  programs.home-manager.enable = true;
}
