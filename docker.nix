{
  users.extraGroups.docker.members = [ "francis" ];

  virtualisation.docker = {
    autoPrune.enable = true;

    enable = true;

    extraOptions = ''
      -H=tcp://0.0.0.0:2375
    '';
  };
}
