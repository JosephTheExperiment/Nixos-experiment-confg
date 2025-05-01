{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { nixpkgs, unstable, ... }@inputs:
  let 
    system = "x86_64-linux";
    stable-pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
    unstable-pkgs = import unstable { inherit system; config.allowUnfree = true; };
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