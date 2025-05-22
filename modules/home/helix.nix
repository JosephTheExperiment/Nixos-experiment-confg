{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    package = "helix";
    defaultEditor = true;
    settings = { theme = "tokyonight"; };
    languages.language = [{
      name = "nix";
      auto-format = true;
      formatter.command = "${pkgs.nixfmt-classic}/bin/nixfmt";
    }];
  };
}
