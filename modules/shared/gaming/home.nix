{ pkgs, ... }: {
  home.packages = [
    pkgs.mangohud
    pkgs.protonup-ng
    heroic
  ];

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
