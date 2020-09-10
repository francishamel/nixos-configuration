{
  networking = {
    enableIPv6 = false;

    firewall = {
      allowedTCPPortRanges = [{
        from = 8000;
        to = 8050;
      }];

      # See https://nixos.wiki/wiki/Spotify for infos on port 57621
      allowedTCPPorts = [ 57621 ];
    };

    hostName = "nixos-T420";

    interfaces.enp0s25.useDHCP = true;
    interfaces.wlp3s0.useDHCP = true;
    interfaces.wlp0s29u1u2.useDHCP = true;

    networkmanager = {
      enable = true;
      wifi.powersave = false;
    };

    useDHCP = false;
  };

  users.extraGroups.networkmanager.members = [ "francis" ];
}
