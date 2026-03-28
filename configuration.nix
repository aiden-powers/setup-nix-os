{ config, pkgs, ... }:

{
  imports = [ <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal-combined.nix>];

  networking.hostName = "powersaj";
  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";
  users.users.powersaj = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
  };

  networking.networkmanager.enable = true;

  services = {
      desktopManager.plasma6.enable = true;
      displayManager.sddm.enable = true;
      displayManager.sddm.wayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
      vim
      git
      wget
      curl
      htop
      tmux
      zip
      unzip
  ];

  security.sudo.enable = true;

  swapDevices = [
      { device = "/swapfile"; }
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.initrd.checkJournalingFS = false;

  system.stateVersion = "24.11";
}
