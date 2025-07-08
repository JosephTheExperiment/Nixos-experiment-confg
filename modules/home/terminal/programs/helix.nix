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
        normal = { A-w = ":wa"; };
        insert = {
          A-n = [":wa" "normal_mode"];
          esc = [":wa" "normal_mode"];
          A-j = "move_visual_line_down";
          A-k = "move_visual_line_up";
          A-h = "move_char_left";
          A-l = "move_char_right";
          A-w = ":wa";
        };
        select = { "A-n" = "normal_mode"; };
      };
    };
    languages = {
      language-server.rust-analyzer.config = { check.command = "clippy"; };
    };
  };
}
