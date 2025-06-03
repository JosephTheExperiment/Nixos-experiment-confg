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
    ];
    fontconfig = {
      antialias = true;
      enable = true;
      defaultFonts = {
        serif = [ "FiraCode Nerd Font Regular" ];
        sansSerif = [ "FiraCode Nerd Font Regular" ];
        monospace = [ "FiraCode Nerd Font Mono Regular" ];
        emoji = [ "Noto Color Emoji" ];
      };
      hinting.autohint = true;
      hinting.enable = true;
      hinting.style = "medium";
    };
  };
}
