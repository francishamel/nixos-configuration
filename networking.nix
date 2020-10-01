{
  networking = {
    enableIPv6 = false;

    firewall = {
      allowedTCPPortRanges = [{
        from = 8000;
        to = 8050;
      }];

      
      allowedTCPPorts = [
        2375  # Docker deamon
        57621 # See https://nixos.wiki/wiki/Spotify for infos
      ];
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

  services.sshd.enable = true;
  
  users.extraGroups.networkmanager.members = [ "francis" ];
}
