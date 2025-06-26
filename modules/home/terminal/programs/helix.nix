{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    package = pkgs.evil-helix;
    defaultEditor = true;
    settings = {
      editor = {
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        auto-save = {
          focus-lost = true;
          after-delay = {
            enable = true;
            timeout = 2500;
          };
        };
      };
      keys.insert = { j = { j = "normal_mode"; }; };
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
