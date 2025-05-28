{
  programs.yazi = {
    enable = true;
    theme = {
      flavor = {
        use = "tokyo-night";
        dark = "tokyo-night";
      };
    };
    flavors = { tokyo-night = ../../../../extras/tokyo-night.yazi; };
  };
}
