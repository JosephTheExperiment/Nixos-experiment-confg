{ pkgs, ... }: {
  gtk = {
    enable = true;
    theme = {
      name = "tokyo-night";
      package = pkgs.tokyonight-gtk-theme;
    };
    iconTheme = {
      name = "colloid-icon-theme";
      package = pkgs.colloid-icon-theme;
    };
    cursorTheme = {
      package = pkgs.nordic;
      name = "Nordic-cursors";
      size = 16;
    };
    gtk3.extraCss = ''
      .xfce4-panel.horizontal {
        border-radius: 12px;
      }
    '';
  };
}
