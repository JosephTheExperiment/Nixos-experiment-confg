{ pkgs, ... }: {
  programs.yazi = {
    enable = true;
    plugins = {
      git = pkgs.yaziPlugins.git;
      starship = pkgs.yaziPlugins.starship;
    };
  };
}
