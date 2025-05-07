{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;
    colorschemes.dracula.enable = true;
    plugins = {
      telescope.enable = true;
      treesitter.enable = true;
    };
  };
}
