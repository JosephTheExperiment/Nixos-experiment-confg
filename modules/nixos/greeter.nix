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
    extraConfig = ''
      [greeter]
      font-name = FiraCode 10
    '';
  };
}
