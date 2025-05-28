{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      pc = {
        system = "x86_64-linux";
        user = "joseph";
        host = "nixos";
        config-path = /home/joseph/Nixos-config;
      };
      pkgs = import nixpkgs {
        system = pc.system;
        config.allowUnfree = true;
      };
      pkgs-unstable = import inputs.nixpkgs-unstable {
        system = pc.system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations.${pc.host} = nixpkgs.lib.nixosSystem {
        system = pc.system;
        specialArgs = { inherit pc pkgs-unstable; };
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
          ./modules/nixos/default.nix
        ];
      };

      homeConfigurations.${pc.user} =
        inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit pc pkgs-unstable; };
          modules = [ ./home.nix ./modules/home/default.nix ];
        };
    };
}
