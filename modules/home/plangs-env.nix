{ pkgs, pkgs-unstable, ... }: {
  home.packages = [
    # Rust
    pkgs.rustup

    # C/C++
    pkgs.cmake
    pkgs.conan
    pkgs.vcpkg
    pkgs.gcc
    pkgs.gnumake
    pkgs.clang-tools
  ];
}