{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    shellAliases = {
      nixos-switch = "sudo nixos-rebuild switch --flake .";
      home-switch = "home-manager switch --flake .";
      pup = "protonup -d ~/.config/heroic/tools/proton";
    };
    plugins = [{
      name = "plugin-git";
      src = pkgs.fishPlugins.plugin-git.src;
    }];
  };
}
