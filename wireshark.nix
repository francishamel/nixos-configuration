{ pkgs, ... }:

{
  programs.wireshark = {
    enable = true;

    package = pkgs.wireshark;
  };

  users.extraGroups.wireshark.members = [ "francis" ];
}