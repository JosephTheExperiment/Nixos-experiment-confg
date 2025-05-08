{ pkgs-unstable, ... }: {
  programs.nh = {
    enable = true;
    package = pkgs-unstable.nh;
    flake = "/home/joseph/Nixos-config";
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 5";
    };
  };
}
