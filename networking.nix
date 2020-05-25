{ pkgs, ... }:

{
  networking = {
    enableIPv6 = false;

    hostName = "nixos-T420";

    interfaces.enp0s25.useDHCP = true;
    interfaces.wlp3s0.useDHCP = true;

    networkmanager = {
      enable = true;

      wifi.powersave = false;
    };

    useDHCP = false;
  };
}
