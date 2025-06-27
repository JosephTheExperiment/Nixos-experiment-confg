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
    };
  };
}
