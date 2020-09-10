{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  boot.kernelPackages = with pkgs; unstable.linuxPackages;
  boot.extraModulePackages = [ config.boot.kernelPackages.rtl8192eu ];

  boot.initrd.luks.devices = {
    root = {
      device = "/dev/disk/by-uuid/c8a8feeb-8b41-4d18-8e13-a797e94b4f2c";
      preLVM = true;
    };
  };

  boot.loader = {
    grub = {
      device = "nodev";

      efiInstallAsRemovable = true;

      efiSupport = true;

      enable = true;

      version = 2;
    };

    timeout = null;
  };
}
