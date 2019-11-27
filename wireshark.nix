{ pkgs, ... }:

{
  programs.wireshark = {
    enable = true;

    package = pkgs.wireshark;
  };

  users.extraUsers.francis.extraGroups = [ "wireshark" ];
}