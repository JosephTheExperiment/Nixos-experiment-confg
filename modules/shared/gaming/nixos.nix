{
  # Enable opengl
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Steam (it just works)
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
}
