{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      sudo = {
        style = "bold green";
        symbol = "👑 ";
        disabled = false;
      };
      username = {
        show_always = true;
        disabled = false;
      };
      status = { disabled = false; };
      hostname = {
        ssh_only = false;
        disabled = false;
      };
    };
  };
}
