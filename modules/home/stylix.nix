{ pkgs, ... }: {
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    polarity = "dark";
    image = ../../assets/nix-wallpaper-nineish.png;
    targets = {
      xfce.enable = true;
      gtk.extraCss = ''
        .xfce4-panel.horizontal {
          border-radius: 12px;
        }
      '';
    };
    fonts = {
      serif = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font Regular";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font Regular";
      };
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font Mono Regular";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
