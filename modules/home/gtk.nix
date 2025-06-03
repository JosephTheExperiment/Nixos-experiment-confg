{ pkgs, ... }: {
  gtk = {
    enable = true;
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
    };
    cursorTheme = {
      package = pkgs.nordic;
      name = "Nordic-cursors";
      size = 16;
    };
    gtk3.extraCss = ''
      .xfce-panal.horizontal {
        borfer-radius: 12px;
      }
    '';
  };
}
