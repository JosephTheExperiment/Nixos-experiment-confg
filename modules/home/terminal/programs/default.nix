{ pkgs, ... }: {
  imports = [ ./git.nix ./helix.nix ];

  home.packages = [ pkgs.manix ];

  programs = {
    bat = {
      enable = true;
      config = { theme = "Sublime Snazz"; };
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    eza = {
      enable = true;
      enableFishIntegration = true;
    };
    thefuck = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
