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
      sizes = {
        terminal = 13;
        applications = 13;
      };
      serif = {
        name = "FiraCode Nerd Font";
        package = pkgs.nerd-fonts.fira-code;
      };
      sansSerif = {
        name = "FiraCode Nerd Font";
        package = pkgs.nerd-fonts.fira-code;
      };
      monospace = {
        name = "FiraCode Nerd Font Mono";
        package = pkgs.nerd-fonts.fira-code;
      };
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-emoji;
      };
    };
  };
}
