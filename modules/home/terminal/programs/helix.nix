{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    package = pkgs.evil-helix;
    defaultEditor = true;
    settings = {
      editor.auto-save = {
        focus-lost = true;
        after-delay = {
          enable = true;
          timeout = 2500;
        };
      };
      keys.insert = { "A-q" = "normal_mode"; };
    };
    languages = {
      language-server.rust-analyzer.config = { check.command = "clippy"; };
      language = [
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
  };
}
