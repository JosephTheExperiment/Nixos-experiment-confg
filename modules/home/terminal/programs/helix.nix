{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    package = pkgs.evil-helix;
    defaultEditor = true;
    settings = {
      file-picker.hidden = false;
      editor = {
        indent-guides = {
          render = true;
          character = "│";
        };
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
      keys = {
        insert = { A-j = "normal_mode"; };
        select = { A-j = "normal_mode"; };
      };
    };
    languages = {
      language-server.rust-analyzer.config = { check.command = "clippy"; };
      language = {
        rust.indent = {
          tab-width = 2;
          unit = " ";
        };
        nix.indent = {
          tab-width = 2;
          unit = " ";
        };
        cpp.indent = {
          tab-width = 2;
          unit = " ";
        };
        c.indent = {
          tab-width = 2;
          unit = " ";
        };
      };
    };
  };
}
