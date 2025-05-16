{ pkgs, ... }: {
  home.packages = [ pkgs.xfce.xfce4-whiskermenu-plugin pkgs.conky ];

  gtk = {
    enable = true;
    theme = {
      name = "Flat Remix";
      package = pkgs.flat-remix-gtk;
    };
    iconTheme = {
      name = "Flat Remix";
      package = pkgs.flat-remix-icon-theme;
    };
    cursorTheme = {
      package = pkgs.vimix-cursor-theme;
      name = "Vimix Cursors";
      size = 16;
    };
  };
}
