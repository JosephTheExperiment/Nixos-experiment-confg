{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 11;
        normal = { family = "FiraCode Nerd Font Mono"; };
      };
      window = {
        dynamic_padding = true;
      };
      selection = {
        save_to_clipboard = true;
      };
    };
  };
}
