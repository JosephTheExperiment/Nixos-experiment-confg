{ lib, ... }: {
  services.conky = {
    enable = true;
    extraConfig = ''
      ${lib.fileContents ./conky.conf}
    '';
  };
}
