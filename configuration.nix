{ pc, lib, pkgs, pkgs-unstable, ... }: {
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname
  networking.hostName = pc.host;

  # Enable networking
  networking.networkmanager.enable = true;

  # Time zone
  time.timeZone = "Africa/Cairo";

  # Internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the xfce as the desktop environment
  # Set the video drivers for amd gpu's
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
    videoDrivers = [ "ati" "amdgpu" ];
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Define a user account
  users.users.${pc.user} = {
    isNormalUser = true;
    description = "Joseph";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = [ pkgs.ibus-engines.typing-booster ];
  };

  system.stateVersion = "24.11"; # No touchy
}
