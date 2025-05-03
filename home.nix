{ config, pkgs, pkgs-unstable, ... }:

{
  home.username = "joseph";
  home.homeDirectory = "/home/joseph";
  home.stateVersion = "24.05"; # Don't change this.

  home.packages = [ ];

  home.file = { };

  home.sessionVariables = { };

  home.enableNixpkgsReleaseCheck = false;

  programs.home-manager.enable = true;
}
