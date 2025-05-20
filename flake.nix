{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      pc = {
        system = "x86_64-linux";
        user = "joseph";
        host = "nixos";
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
        specialArgs = { inherit pc pkgs pkgs-unstable; };
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
          modules = [
            ./home.nix
            ./modules/home/default.nix
            inputs.nix-flatpak.homeManagerModules.nix-flatpak
          ];
        };
    };
}
