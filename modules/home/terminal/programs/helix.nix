{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    package = pkgs.evil-helix;
    defaultEditor = true;
    settings = {
      theme = "tokyonight";
      keys.insert = { "Win-q" = "normal_mode"; };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
      }
      {
        name = "rust";
        auto-format = true;
      }
      {
        name = "cpp";
        auto-format = true;
      }
      {
        name = "c";
        auto-format = true;
      }
    ];
  };
}
