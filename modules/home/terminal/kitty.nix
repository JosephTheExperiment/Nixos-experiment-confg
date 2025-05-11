{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    themeFile = "Grape";
    font = {
      package = pkgs.fira-code;
      name = "Fira Code";
      size = 10;
    };
  };
}