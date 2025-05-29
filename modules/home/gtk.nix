{ pkgs, ... }: {
  gtk = {
    enable = true;
    theme = {
      name = "tokyo-night";
      package = pkgs.tokyonight-gtk-theme;
    };
    iconTheme = {
      name = "tokyo-night";
      package = pkgs.tokyonight-gtk-theme;
    };
    cursorTheme = {
      package = pkgs.vimix-cursors;
      name = "Vimix Cursors";
      size = 16;
    };
    gtk3.extraCss = ''
      .xfce4-panel.horizontal {
        border-radius: 10px;
      }
    '';
  };
}
