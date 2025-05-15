{ pkgs, ... }: {
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
  }; 
}
