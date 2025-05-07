{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    colorschemes.dracula.enable = true;
  };
}