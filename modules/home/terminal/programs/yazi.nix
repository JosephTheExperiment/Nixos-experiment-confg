{ pc }: {
  programs.yazi = {
    enable = true;
    theme = {
      flavor = {
        use = "tokyo-night";
        dark = "tokyo-night";
      };
    };
    flavors = { tokyo-night = "${pc.config-root}/extras/tokyo-night"; };
  };
}
