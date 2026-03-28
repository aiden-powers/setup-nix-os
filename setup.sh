#! /bin/bash
set -e # if any command fails, exit immediately

sudo nix-channel --add https://nixos.org/channels/nixos-25.11 nixos
sudo nix-channel --update
printf "NIX_PATH: %s\n" "$NIX_PATH"

sudo wipefs -a /dev/sda # Remove: 1. partition tales, 2. filesystem signatures, 3. swap signatures
sudo dd if=/dev/zero of=/dev/sda bs=1M count=100 # overwrite 100mb of zeros at the beginning of the disk, make sure nothing is there so we can write to it
sudo parted /dev/sda -- mklabel msdos
sudo parted /dev/sda -- mkpart primary ext4 1MiB -20GB
sudo parted /dev/sda -- mkpart primary linux-swap -4GB 100%
sudo mkfs.ext4 -L nixos /dev/sda1
sudo mkswap -L swap /dev/sda2
sudo mount /dev/disk/by-label/nixos /mnt
sudo swapon /dev/sda2

sudo curl -o /mnt/etc/nixos/configuration.nix \ https://raw.githubusercontent.com/aiden-powers/setup-nix-os/refs/heads/main/configuration.nix