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

  # Enable the budgie for x11 desktop environment
  # Set the video drivers for amd gpu's
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
    videoDrivers = [ "ati" "amdgpu" ];
  };

  # Enable gnome-keyring for git
  services.gnome.gnome-keyring.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable sound with pipewire
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Define a user account
  users.users.${pc.user} = {
    isNormalUser = true;
    description = "Joseph";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System wide packages
  environment.systemPackages = [ pkgs.floorp pkgs.busybox pkgs.home-manager ];

  # Enable appimage support
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # Enable flatpak and xdg portal
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Enable zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Fonts
  fonts.packages =
    [ pkgs.nerdfonts pkgs.noto-fonts pkgs.dejavu_fonts pkgs.font-awesome ];

  system.stateVersion = "24.11"; # No touchy
}
