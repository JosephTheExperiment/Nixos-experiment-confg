#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash
set -e
flake=/home/joseph/Nixos-config/

git add .
echo "Git commit massage:"
read commitMassage

echo ""
git commit -m "$commitMassage"

echo ""
echo "Do you want to?"
echo "1: Nixos rebuild switch"
echo "2: Home manager switch"
echo "3: 1 and 2"
echo "4: Nothing"
read actionNumber

echo ""
if [ $actionNumber -eq 1 ]; then 
  echo "Nixos-rebuild switch:"
  sudo nixos-rebuild switch --flake $flake
elif [ $actionNumber -eq 2 ]; then 
  echo "Home mangaer switch:"
  home-manager switch --flake $flake
elif [ $actionNumber -eq 3 ]; then
  echo "Nixos-rebuild switch:"
  sudo nixos-rebuild switch --flake $flake
  
  echo ""
  echo "Home mangaer switch:"
  home-manager switch --flake $flake
fi