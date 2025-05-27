{ pkgs, ... }: {
  gtk = {
    enable = true;
    theme = {
      name = "Flat-Remix-GTK-Blue-Dark";
      package = pkgs.flat-remix-gtk;
    };
    iconTheme = {
      name = "Flat-Remix-Blue-Dark";
      package = pkgs.flat-remix-icon-theme;
    };
    cursorTheme = {
      package = pkgs.quintom-cursor-theme;
      name = "Quintom_Ink";
      size = 16;
    };
    gtk3.extraCss = ''
      .xfce4-panel.horizontal {
        border-radius: 10px;
      }
    '';
  };
}
