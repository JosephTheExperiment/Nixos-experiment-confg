{ pkgs, ... }: {
  imports = [ ./git.nix ./helix.nix ./yazi.nix ];

  home.packages = [ pkgs.emoji-picker ];

  programs = {
    bat = {
      enable = true;
      config = { theme = "Dracula"; };
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
      options = [ "--cmd cd" ];
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
