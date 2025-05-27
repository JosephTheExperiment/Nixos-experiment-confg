{ pkgs, ... }: {
  services.xserver.displayManager.lightdm.greeters.gtk = {
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
      name = "quintom-cursor-theme";
      size = 16;
    };
    extraConfig = ''
      [greeter]
      font-name = FiraCode 10
    '';
  };
}
