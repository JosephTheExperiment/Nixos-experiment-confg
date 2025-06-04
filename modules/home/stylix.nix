{ pkgs, ... }: {
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
    polarity = "dark";
    targets = {
      xfce.enable = false;
      gtk.enable = false;
      kde.enable = false;
    };
    fonts = {
      packages = [ pkgs.nerd-fonts.sauce-code-pro pkgs.noto-fonts-emoji ];
      sizes.applications = 10;
      serif.name = "SauceCodePro Nerd Font";
      sansSerif.name = "SauceCodePro Nerd Font";
      monospace.name = "SauceCodePro Nerd Font Mono";
      emoji.name = "Noto Color Emoji";
    };
  };
}
