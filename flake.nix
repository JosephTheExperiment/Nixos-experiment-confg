{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
        specialArgs = { inherit pkgs-unstable; };
        modules = [
          ./configuration.nix
          ./hardware-configuration.nix
          ./modules/nixos/default.nix
        ];
      };

      homeConfigurations.${pc.user} =
        inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit pkgs-unstable; };
          modules = [
            ./home.nix
            inputs.nixvim.homeManagerModules.nixvim
            ./modules/home/default.nix
          ];
        };
    };
}
