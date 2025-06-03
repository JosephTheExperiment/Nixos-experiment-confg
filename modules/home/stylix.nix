{ pkgs, ... }: {
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
    polarity = "dark";
    image = ../../assets/nix-wallpaper-nineish.png;
    imageScalingMode = "fit";
    targets = {
      xfce.enable = false;
      gtk.enable = false;
      kde.enable = false;
    };
    fonts.sizes.applications = 10;
  };
}
