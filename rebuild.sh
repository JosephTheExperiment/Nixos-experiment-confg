#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash
set -e

git add .
echo "Git commit massage:"
read commitMassage

echo "\n"
git commit -m "$commitMassage"

echo "\n"
echo "Do you want to?"
echo "1: Nixos rebuild switch"
echo "2: Home manager switch"
echo "3: 1 and 2"
echo "4: Nothing"
read actionNumber

echo "\n"
if [ $actionNumber -eq 1 ]; then 
  sudo nixos-rebuild switch --flake /home/joseph/Nixos-config/
elif [ $actionNumber -eq 2 ]; then 
  home-manager switch --flake /home/joseph/Nixos-config/
elif [ $actionNumber -eq 3 ]; then
  sudo nixos-rebuild switch --flake /home/joseph/Nixos-config/
  home-manager switch --flake /home/joseph/Nixos-config/
fi