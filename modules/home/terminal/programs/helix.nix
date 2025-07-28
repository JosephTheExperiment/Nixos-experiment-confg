{ pkgs, pkgs-unstable, ... }: {
  programs.helix = {
    enable = true;
    package = pkgs-unstable.helix;
    defaultEditor = true;
    settings = {
      editor = {
        file-picker.hidden = false;
        mouse = false;
        cursorline = true;
        color-modes = true;
        completion-replace = true;
        completion-timeout = 100;
        end-of-line-diagnostics = "hint";
        inline-diagnostics = {
          cursor-line = "warning";
        };
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
            timeout = 3000;
          };
        };
      };
      keys = {
        normal = { A-w = ":wa"; };
        insert = {
          A-j = "move_visual_line_down";
          A-k = "move_visual_line_up";
          A-h = "move_char_left";
          A-l = "move_char_right";
          A-w = ":wa";
        };
      };
    };
    languages = {
      language-server.rust-analyzer.config = { check.command = "clippy"; };
    };
  };
}
