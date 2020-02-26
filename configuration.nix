{ config, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./docker.nix
    ./fonts.nix
    ./hardware.nix
    ./hardware-configuration.nix
    ./i18n.nix
    ./lorri.nix
    ./networking.nix
    ./redshift.nix
    ./user.nix
    ./virtualbox.nix
    ./wireshark.nix
    # ./vscode.nix
    ./xserver.nix
    ./zsh.nix
  ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    burpsuite
    curl
    direnv
    discord
    docker-compose
    firefox
    git
    gwenview
    htop
    kcalc
    keepassxc
    okular
    slack
    vscode
  ];

  programs.tmux.enable = true;
  programs.vim.defaultEditor = true;
  
  system.stateVersion = "19.09";
}