{ pkgs, ... }: {
  imports = [ ./git.nix ./helix.nix ./yazi.nix ];

  programs = {
    bat.enable = true;
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
