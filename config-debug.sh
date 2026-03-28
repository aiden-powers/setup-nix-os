sudo systemctl stop nix-daemon
sudo mv /nix/var/nix/db/db.sqlite /nix/var/nix/db/db.sqlite-bkp
sqlite3 /nix/var/nix/db/db.sqlite-bkp ".dump" | sqlite3 /nix/var/nix/db/db.sqlite
sudo systemctl start nix-daemon

sudo nixos-generate-config --root /mnt
sudo curl -O https://raw.githubusercontent.com/aiden-powers/setup-nix-os/refs/heads/main/configuration.nix
sudo mv configuration.nix /mnt/etc/nixos/configuration.nix