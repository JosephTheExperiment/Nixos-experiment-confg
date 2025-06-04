{ pkgs, ... }: {
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = [
      pkgs.noto-fonts
      pkgs.noto-fonts-color-emoji
      pkgs.nerd-fonts.fira-code
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.nerd-fonts.symbols-only
      pkgs.nerd-fonts.sauce-code-pro
    ];
    fontconfig = {
      enable = true;
      antialias = true;
      cache32Bit = true;
      defaultFonts = { emoji = [ "Noto Color Emoji" ]; };
      hinting.enable = true;
      hinting.style = "medium";
    };
  };
}
