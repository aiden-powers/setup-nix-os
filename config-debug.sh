sudo nixos-generate-config --root /mnt
sudo curl -O https://raw.githubusercontent.com/aiden-powers/setup-nix-os/refs/heads/main/configuration.nix
sudo mv configuration.nix /mnt/etc/nixos/configuration.nix