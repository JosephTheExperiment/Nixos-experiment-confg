{ pkgs, ... }: {
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
  };

  xdg.configFile."zellij/config.kdl".text = ''
    default_shell "fish"
    theme "tokyo-night"
    scrollback_editor "${pkgs.evil-helix}/bin/hx"
    show_startup_tips false
  '';
}
