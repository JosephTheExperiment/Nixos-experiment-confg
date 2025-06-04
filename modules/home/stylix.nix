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
        name = "SauceCodePro Nerd Font";
        package = pkgs.nerd-fonts.sauce-code-pro;
      };
      sansSerif = {
        name = "SauceCodePro Nerd Font";
        package = pkgs.nerd-fonts.sauce-code-pro;
      };
      monospace = {
        name = "SauceCodePro Nerd Font Mono";
        package = pkgs.nerd-fonts.sauce-code-pro;
      };
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-emoji;
      };
    };
  };
}
