set shell := ["fish", "-c"]

default:
    @just --list --unsorted

nixos-switch:
    sudo nixos-rebuild switch --flake .

home-switch:
    home-manager switch --flake .

system-switch: nixos-switch home-switch

gc commit-massage:
    git add .
    git commit -m "{{commit-massage}}"

[confirm("Delete all nixos generations?")]
nix-cg:
    sudo nix-collect-garbage -d

[confirm("Wish to update flake.look?")]
update-flake:
    nix flake update

flatpak-programs-install:
    bash ./scripts/flatpak.sh

language-env-install:
    bash ./scripts/language-env.sh

[confirm("Install the full configuration for the system?!!")]
full-config-install: system-switch flatpak-programs-install language-env-install
