{ pkgs, ... }:

{
  # Git config
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    userEmail = "yousef.hisham444@proton.me";
    userName = "JosephTheExperiment";
    extraConfig = {
      credential = {
        helper = "manager";
        credentialStore = "secretservice";
      };
    };
  };
}
