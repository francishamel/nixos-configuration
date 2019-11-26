{ ... }:

{
  users.mutableUsers = false;

  users.extraUsers.francis = {
    createHome = true;
    
    extraGroups = [ "audio" "network" "video" "wheel"];
    
    isNormalUser = true;
    
    password = "";
    
    uid = 1000;
  };
}