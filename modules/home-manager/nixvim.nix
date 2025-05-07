{ pkgs, nixvim, ... }: {
  nixvim = {
    enable = true;
    colorschemes.dracula.enable = true;
  }
}