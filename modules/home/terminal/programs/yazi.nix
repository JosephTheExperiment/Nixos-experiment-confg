{ pc, ... }: {
  programs.yazi = {
    enable = true;
    theme = {
      flavor = {
        use = "tokyo-night";
        dark = "tokyo-night";
      };
    };
    flavors = { tokyo-night = "${pc.config-path}/extras/tokyo-night.yazi"; };
  };
}
