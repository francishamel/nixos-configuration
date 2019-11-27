{ config, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./docker.nix
    ./fonts.nix
    ./hardware.nix
    ./hardware-configuration.nix
    ./i18n.nix
    ./networking.nix
    ./redshift.nix
    ./user.nix
    ./virtualbox.nix
    ./wireshark.nix
    ./xserver.nix
    ./zsh.nix
  ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    curl
    firefox
    git
    htop
    nox
  ];

  programs.tmux.enable = true;
  programs.vim.defaultEditor = true;
  
  system.stateVersion = "19.09";
}