{
  programs.yazi = {
    enable = true;
    theme = {
      flavor = {
        use = "tokyo-night";
        dark = "tokyo-night";
      };
    };
    flavors = { tokyo-night = builtins.toString ./extras/tokyo-night; };
  };
}
