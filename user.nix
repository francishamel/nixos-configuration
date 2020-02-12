{ pkgs, ... }:

{
  users = {    
    extraUsers.francis = {
      createHome = true;
    
      extraGroups = [ "audio" "networkmanager" "video" "wheel"];
    
      isNormalUser = true;
    
      password = "";
    
      uid = 1000;
    };

    mutableUsers = false;
  };
}