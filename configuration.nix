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

  nix.autoOptimiseStore = true;

  nixpkgs.config.allowUnfree = true;

  console.useXkbConfig = true;

  location.provider = "geoclue2";

  services.sshd.enable = true;

  services.xserver.layout = "ca";

  time.timeZone = "America/Montreal";

  system.stateVersion = "20.09";
}
