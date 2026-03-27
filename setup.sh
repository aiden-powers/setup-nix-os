#! /bin/bash

sudo nix-channel --add https://nixos.org/channels/nixos-25.11 nixos
sudo nix-channel --update
printf "NIX_PATH: %s\n" "$NIX_PATH"