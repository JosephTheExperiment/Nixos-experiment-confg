set shell := ["fish", "-c"]

default:
    @just --list --unsorted

nixos-switch:
    @echo "Nixos switch:"
    sudo nixos-rebuild switch --flake .

home-switch:
    @echo "Home-manager switch:"
    home-manager switch --flake .

system-switch: nixos-switch home-switch

gc commit-massage:
    #!/usr/bin/env bash
    git add .
    git commit -m "{{commit-massage}}"

[confirm("Delete all nixos generations?")]
nix-cg:
    sudo nix-collect-garbage -d

[confirm("Wish to update flake.look?")]
update-flake:
    nix flake update

[confirm("Wish to install all specified flatpak programs?")]
flatpak-programs-install:
    bash ./scripts/flatpak.sh

[confirm("Install the full configuration for the system?!!")]
full-config-install: system-switch flatpak-programs-install
