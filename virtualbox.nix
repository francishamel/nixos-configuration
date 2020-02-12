{ ... }:

{
  users.extraGroups.vboxusers.members = [ "francis" ];

  virtualisation.virtualbox.host = {
    enable = true;

    enableExtensionPack = true;
  };
}