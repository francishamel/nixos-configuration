{
  imports = [
    ./boot.nix
    ./cachix.nix
    ./docker.nix
    ./fonts.nix
    ./hardware-configuration.nix
    ./hardware.nix
    ./networking.nix
    ./user.nix
    ./virtualbox.nix
    ./xserver.nix
  ];

  nix = {
    autoOptimiseStore = true;
    
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  nixpkgs.config.allowUnfree = true;

  console.useXkbConfig = true;

  location.provider = "geoclue2";

  services.sshd.enable = true;

  services.xserver.layout = "ca";

  time.timeZone = "America/Montreal";

  system.stateVersion = "20.09";
}
