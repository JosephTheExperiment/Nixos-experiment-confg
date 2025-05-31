{ pkgs, pkgs-unstable, ... }: {
  home.packages = [
    # Rust
    pkgs.rustup

    # C/C++
    pkgs.cmake
    pkgs.conan
    pkgs.vcpkg
    pkgs.gcc
    pkgs.clang-tools

    # Build tools
    pkgs.just
    pkgs.gnumake

    # Assembly x86
    pkgs.nasm
    pkgs.nasmfmt
    pkgs.asm-lsp

    # Nix
    pkgs.nixfmt-classic
    pkgs.nixd
  ];
}
