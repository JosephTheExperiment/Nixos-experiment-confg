{ pkgs, ... }: {
  imports = [ ./git.nix ./helix.nix ];

  home.packages = [ pkgs.manix ];

  programs = {
    bat.enable = true;
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    eza = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
