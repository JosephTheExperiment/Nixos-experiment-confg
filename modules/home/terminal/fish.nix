{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    shellAliases = {
      nixos-switch = "sudo nixos-rebuild switch --flake .";
      home-switch = "home-manager switch --flake .";
      gaa-gca = "git add . && git commit -a -m";
    };
    plugins = [
      {
        name = "plugin-git";
        src = pkgs.fishPlugins.plugin-git.src;
      }
      {
        name = "fishplugin-autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "fishplugin-plugin-sudope";
        src = pkgs.fishPlugins.plugin-sudope.src;
      }
    ];
  };
}
