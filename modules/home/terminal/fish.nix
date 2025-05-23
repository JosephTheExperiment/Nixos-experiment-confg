{ pkgs, ... }: {
  home.packages = [ pkgs.thefuck ];
  home.shell.enableFishIntegration = true;
  programs.fish = {
    enable = true;
    shellAliases = {
      nixos-switch = "sudo nixos-rebuild switch --flake .";
      home-switch = "home-manager switch --flake .";
    };
  };
}
