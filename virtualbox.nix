{ ... }:

{
  users.extraUsers.francis.extraGroups = [ "vboxusers" ];

  virtualisation.virtualbox.host = {
    enable = true;

    enableExtensionPack = true;
  };
}