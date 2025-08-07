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
    just nixos-switch

[confirm("Wish to update flake.lock?")]
update-flake:
    nix flake update

update-system: update-flake system-switch
    flatpak update -y

flatpak-programs-install:
    bash ./scripts/flatpak.sh

software-install:
    bash ./scripts/software.sh

[confirm("Install the full configuration for the system?!!")]
full-config-install: system-switch flatpak-programs-install software-install
