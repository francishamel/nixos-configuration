{ pkgs, ... }:

{
  # Supposedly better for the SSD.
  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];
  
  hardware.bluetooth.enable = true;

  hardware.pulseaudio = {
    enable = true;

    package = pkgs.pulseaudioFull;
  };

  sound.enable = true;
}