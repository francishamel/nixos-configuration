{ ... }:

{
  users.extraUsers.francis.extraGroups = [ "docker" ];
    
  virtualisation.docker = {
    autoPrune.enable = true;
    
    enable = true;
  };
}
