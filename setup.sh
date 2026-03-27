#! /bin/bash

sudo nix-channel --add https://nixos.org/channels/nixos-25.11 nixos
sudo nix-channel --update
printf "NIX_PATH: %s\n" "$NIX_PATH"
sudo parted /dev/sda -- mklabel gpt
sudo parted /dev/sda -- mkpart root ext4 512MB -8GB
sudo parted /dev/sda -- mkpart swap linux-swap -8GB 100%
sudo parted /dev/sda -- mkpart ESP fat32 1MB 512MB
sudo parted /dev/sda -- set 3 esp on
sudo mkfs.ext4 -L nixos /dev/sda1
sudo mkswap -L swap /dev/sda2
sudo mount /dev/disk/by-label/nixos /mnt
sudo swapon /dev/sda2
sudo nixos-generate-config --root /mnt