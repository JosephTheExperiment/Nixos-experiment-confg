{ pkgs-unstable, ... }: {
  programs.nh = {
    enable = true;
    package = pkgs-unstable.nh;
  };
}
