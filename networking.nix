{ pkgs, ... }:

{
  networking = {
    hostName = "nixos-T420";

    interfaces.enp0s25.useDHCP = true;
    interfaces.wlp3s0.useDHCP = true;

    networkmanager.enable = true;

    useDHCP = false;
  };
}