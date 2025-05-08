{ config, pkgs-unstable, ... }: {
  programs.nh = {
    enable = true;
    package = pkgs-unstable.nh;
    flake = "/home/joseph/Nixos-config";
    clean.enable = true;
    clean.extraArgs = "--keep-since 3d --keep 3";
  };
}
