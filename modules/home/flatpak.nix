{ lib, ... }: {
  services.flatpak = {
    remotes = [{
      name = "flathub";
      location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    }];
    packages = [{
      appId = "app.zen_browser.zen";
      origin = "flathub";
    }];
  };
}
