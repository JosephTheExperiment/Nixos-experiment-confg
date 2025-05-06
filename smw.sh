# System management wizard
#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash

set -e
configPath=/home/joseph/Nixos-config/

echo "Do you want to?"
echo "1: Update flake.lock"
echo "2: Delete old generations"
echo "3: System rebuild"
read actionNumber
echo ""

if [ $actionNumber -eq 1 ]; then 
  echo "Update flake.lock:"
  nix flake update --flake $configPath
  echo ""

  echo "Choose system rebuild (option 3 two times) to apply the updates!"
  ./$configPath/$0
elif [ $actionNumber -eq 2 ]; then 
  echo "Delete old generations:"
  sudo nix-collect-garbage -d
elif [ $actionNumber -eq 3 ]; then
  echo "System rebuild:"

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
  read rebuildActionNumber
  echo ""

  if [ $rebuildActionNumber -eq 1 ]; then 
    echo "Nixos-rebuild switch:"
    sudo nixos-rebuild switch --flake $configPath
  elif [ $rebuildActionNumber -eq 2 ]; then 
    echo "Home mangaer switch:"
    home-manager switch --flake $configPath
  elif [ $rebuildActionNumber -eq 3 ]; then
    echo "Nixos-rebuild switch:"
    sudo nixos-rebuild switch --flake $configPath
    echo ""

    echo "Home mangaer switch:"
    home-manager switch --flake $configPath
  fi
fi