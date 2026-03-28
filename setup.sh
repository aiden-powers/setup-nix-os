#! /bin/bash
set -e # if any command fails, exit immediately

sudo nix-channel --add https://nixos.org/channels/nixos-25.11 nixos
sudo nix-channel --update
printf "NIX_PATH: %s\n" "$NIX_PATH"

sudo parted /dev/sda -- mklabel msdos
sudo parted /dev/sda -- mkpart primary 1MB -32GB
sudo parted /dev/sda -- set 1 boot on
sudo parted /dev/sda -- mkpart primary linux-swap -4GB 100%
sudo mkfs.ext4 -L nixos /dev/sda1
sudo mkswap -L swap /dev/sda2
sudo mount /dev/disk/by-label/nixos /mnt
sudo swapon /dev/sda2
