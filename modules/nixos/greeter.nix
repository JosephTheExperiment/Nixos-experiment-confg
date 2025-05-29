{ pkgs, ... }: {
  services.xserver.displayManager.lightdm.greeters.gtk = {
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
    extraConfig = ''
      [greeter]
      font-name = FiraCode 10
    '';
  };
}
