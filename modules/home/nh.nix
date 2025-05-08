{ pkgs-unstable, ... }: {
  programs.nh = {
    enable = true;
    flake = "/home/joseph/Nixos-config";
    package = pkgs-unstable.nh;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 5";
    };
  };
}
