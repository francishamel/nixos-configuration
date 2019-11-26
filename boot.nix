{ ... }:

{
  boot.initrd.luks.devices = [
    {
      device = "/dev/disk/by-uuid/c8a8feeb-8b41-4d18-8e13-a797e94b4f2c";
      name = "root";
      preLVM = true;
    }
  ];

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