{
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };
    plugins.lualine = { enable = true; };
    clipboard.register = "unnamedplus";
    globals.mapleader = " ";
  };
}
