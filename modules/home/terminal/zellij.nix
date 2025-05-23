{ pkgs, ... }: {
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    attachExistingSession = true;
    settings = {
      theme = "tokyo-night";
      scrollback_editor = "${pkgs.helix}/bin/hx";
      default_shell = "fish";
    };
  };
}