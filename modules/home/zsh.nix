{ pkgs, pkgs-unstable, ... }: {
  home.shell.enableZshIntegration = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      nix-switch = "sudo nixos-rebuild switch --flake .";
      home-switch = "home-manager switch --flake .";
    };

    history.size = 1000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "gnzh";
    };
  };
}
