sudo nix-channel --add https://nixos.org/channels/nixos-25.11 nixos
sudo nix-channel --update
echo -n "NIX_PATH: "
echo $NIX_PATH