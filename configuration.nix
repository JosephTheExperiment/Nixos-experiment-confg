{ pc, pkgs, pkgs-unstable, ... }:

{
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
  environment.systemPackages = [ pkgs.brave pkgs.busybox pkgs.home-manager ];

  # Enable appimage support
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # Enable zsh and set console font 
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  console = {
    font = "Fira_Code";
    packages = [ pkgs.fira-code ];
  };

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
