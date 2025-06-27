{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    package = pkgs.evil-helix;
    defaultEditor = true;
    settings = {
      editor = {
        file-picker.hidden = false;
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
        insert = {
          C.n = "normal_mode";
          C.j = "move_visual_line_down";
          C.k = "move_visual_line_up";
          C.h = "move_char_left";
          C.l = "move_char_right";
        };
        select = { "C.n" = "normal_mode"; };
      };
    };
    languages = {
      language-server.rust-analyzer.config = { check.command = "clippy"; };
    };
  };
}
