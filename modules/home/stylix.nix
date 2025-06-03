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
    };
    fonts = {
      sizes.applications = 10;
      packages = [
        pkgs.noto-fonts
        pkgs.noto-fonts-color-emoji
        pkgs.nerd-fonts.fira-code
        pkgs.nerd-fonts.jetbrains-mono
        pkgs.nerd-fonts.symbols-only
      ];
      serif = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };
      sansSerif = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font";
      };
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
