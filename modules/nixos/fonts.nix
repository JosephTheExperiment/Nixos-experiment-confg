{ pkgs, ... }: {
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = [
      pkgs.noto-fonts
      pkgs.noto-fonts-color-emoji
      pkgs.nerd-fonts.fira-code
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.nerd-fonts.hack
      pkgs.nerd-fonts.symbols-only
    ];
    fontconfig = {
      antialias = true;
      cache32Bit = true;
      enable = true;
      defaultFonts.emoji = [ "Noto Color Emoji" ];
      hinting.autohint = true;
      hinting.enable = true;
      hinting.style = "medium";
    };
  };
}
