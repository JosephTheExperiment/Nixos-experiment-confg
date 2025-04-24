{ config, pkgs, ... }:

{ 
  services.xserver.monitorSection = ''
    Identifier "VGA-0"
    Modeline "1600x900_60.00"  118.25  1600 1696 1856 2112  900 903 908 934 -hsync +vsync
    Option "PreferredMode" "1600x900_60.00"
  '';

  services.xserver.screenSection = ''
    Identifier "Screen0"
    Monitor "VGA-0"
    DefaultDepth 24
    SubSection "Display"
        Modes "1600x900_60.00"
    EndSubSection
  '';
}
