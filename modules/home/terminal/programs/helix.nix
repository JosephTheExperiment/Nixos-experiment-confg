{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    package = pkgs.evil-helix;
    defaultEditor = true;
    settings = { keys.insert = { "A-q" = "normal_mode"; }; };
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
