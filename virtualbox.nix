{
  users.extraGroups.vboxusers.members = [ "francis" ];

  virtualisation.virtualbox.host = {
    enable = false;

    enableExtensionPack = true;
  };
}
