{ ... }:

{
  users.extraGroups.docker.members = [ "francis" ];
    
  virtualisation.docker = {
    autoPrune.enable = true;
    
    enable = true;
  };
}
