{ pkgs, ... }: {
  gtk = {
    enable = true;
    theme = {
      name = "Nordic-darker-standard-buttons";
      package = pkgs.nordic;
    };
    iconTheme = {
      name = "Nordic-darker";
      package = pkgs.nordic;
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
