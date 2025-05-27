{ pkgs, ... }: {
  home.sessionVariables = {
    ZELLIJ_AUTO_ATTACH = "true";
    ZELLIJ_AUTO_EXIT = "true";
  };

  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      theme = "tokyo-night";
      scrollback_editor = "${pkgs.helix}/bin/hx";
      default_shell = "fish";
    };
  };
}
