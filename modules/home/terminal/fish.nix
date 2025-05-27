{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    shellAliases = {
      nixos-switch = "sudo nixos-rebuild switch --flake .";
      home-switch = "home-manager switch --flake .";
    };
    plugins = [{
      name = "plugin-git";
      src = pkgs.fishPlugins.plugin-git.src;
    }];
  };
}
