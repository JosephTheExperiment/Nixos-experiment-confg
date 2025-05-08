{ pkgs, pkgs-unstable, ... }:

{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname
  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Time zone
  time.timeZone = "Africa/Cairo";

  # Internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the GNOME Desktop Environment
  services.xserver = {
    enable = true;
    videoDrivers = [ "ati" "amdgpu" ];
    desktopManager.gnome.enable = true;
    displayManager = {
      gdm.enable = true;
      gdm.wayland = false;
    };
  };
  
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

  # Define a user account
  users.users.joseph = {
    isNormalUser = true;
    description = "Joseph";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System wide packages
  environment.systemPackages = [ pkgs.brave pkgs.toybox pkgs.home-manager ];

  # Enable appimage support
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # Fonts
  fonts.packages = [
    pkgs.fira-code
    pkgs.fira-code-symbols
    pkgs.noto-fonts
    pkgs.dejavu_fonts
    pkgs.font-awesome
  ];

  system.stateVersion = "24.11"; # No touchy
}
