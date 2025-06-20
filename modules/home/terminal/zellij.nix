{ pkgs, ... }: {
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    exitShellOnExit = true;
    settings = {
      default_shell = "fish";
      scrollback_editor = "${pkgs.evil-helix}/bin/hx";
      show_startup_tips = false;
      on_force_close = "quit";
      copy_on_select = false;
    };
  };
}
