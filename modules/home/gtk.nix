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
    gtk3.extraCss = ''
      .xfce4-panel.vertical {
        border-bottom-left-radius: 15px;
        border-top-left-radius: 15px;
        border-width: 25px;
      }
    '';
  }; 
}
