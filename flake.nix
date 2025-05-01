{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, unstable, ... }@inputs:
  let 
    system = "x86_64-linux";
    stable-pkgs = nixpkgs.legacyPackages.${system};
    unstable-pkgs = unstable.legacyPackages.${system};
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit stable-pkgs; inherit unstable-pkgs; };
      modules = [
        ./configuration.nix
      ];
    };
  };
}