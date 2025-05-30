{ pc, pkgs, ... }: {
  home.packages = [ pkgs.mangohud pkgs.protonup-ng pkgs.heroic pkgs.azahar ];

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "/home/${pc.user}/.config/heroic/tools/proton";
  };
}
