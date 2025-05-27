{ lib, pkgs, ... }: {
  home.sessionVariables = {
    ZELLIJ_AUTO_ATTACH = lib.mkDefault "true";
    ZELLIJ_AUTO_EXIT = lib.mkDefault "true";
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
