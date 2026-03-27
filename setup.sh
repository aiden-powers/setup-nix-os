sudo nix-channel --add https://nixos.org/channels/nixos-25.11 nixos
sudo nix-channel --update
printf "This is the first string, followed by a variable value: %s\n" "$NIX_PATH"