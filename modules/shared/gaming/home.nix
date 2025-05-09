{ pkgs, ... }: {
  home.packages = [
    pkgs.mangohud
    pkgs.protonup-ng
    pkgs.heroic
  ];

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "/home/joseph/.config/heroic/tools/proton";
  };
}
