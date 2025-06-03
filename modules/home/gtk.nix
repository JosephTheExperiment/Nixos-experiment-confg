{ pkgs, ... }: {
  gtk = {
    enable = true;
    iconTheme = {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
    };
    cursorTheme = {
      package = pkgs.nordic;
      name = "Nordic-cursors";
      size = 16;
    };
  };
}
