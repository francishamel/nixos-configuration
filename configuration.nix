{
  imports = [
    ./boot.nix
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

  services.xserver = {
    layout = "ca";
    xkbOptions = "ctrl:swapcaps";
  };

  time.timeZone = "America/Montreal";

  system.stateVersion = "21.05";
}
