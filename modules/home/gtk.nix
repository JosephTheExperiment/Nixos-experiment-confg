{ pkgs, ... }: {
  gtk = {
    enable = true;
    theme = {
      name = "nordic";
      package = pkgs.nordic;
    };
    iconTheme = {
      name = "nordzy-icon-theme";
      package = pkgs.nordzy-icon-theme;
    };
    cursorTheme = {
      package = pkgs.nordzy-cursor-theme;
      name = "nordzy-cursor-theme";
      size = 16;
    };
    gtk3.extraCss = ''
      .xfce4-panel.horizontal {
        border-radius: 10px;
      }
    '';
  };
}
