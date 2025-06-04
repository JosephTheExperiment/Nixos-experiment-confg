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
      sizes.applications = 10;
      serif = {
        package = pkgs.nerd-fonts.sauce-code-pro;
        name = "SauceCodePro Nerd Font";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.sauce-code-pro;
        name = "SauceCodePro Nerd Font";
      };
      monospace = {
        package = pkgs.nerd-fonts.sauce-code-pro;
        name = "SauceCodePro Nerd Font Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
