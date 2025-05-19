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
      package = pkgs.vimix-cursor-theme;
      name = "Vimix-Cursors";
      size = 16;
    };
    gtk3.extraCss = ''
      .xfce4-panel.horizontal {
        border-radius: 12px;
        
      }

      .xfce4-panel.vertical {
        border-top-left-radius: 12px;
        border-bottom-left-radius: 12px;
      }
    '';
  };
}
