{ pkgs, ... }: {
  services.xserver.displayManager.lightdm.greeters.gtk = {
    enable = true;
    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme;
    };
    iconTheme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-icon-theme;
    };
    cursorTheme = {
      package = pkgs.nordic;
      name = "Nordic-cursors";
      size = 16;
    };
    extraConfig = ''
      [greeter]
      font-name = FiraCode 10
    '';
  };
}
