{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    shellAliases = {
      nixos-switch = "sudo nixos-rebuild switch --flake .";
      home-switch = "home-manager switch --flake .";
    };
    shellAbbrs = { zx = "zoxide"; };
  };
}
