{
  services.xserver = {
    desktopManager = {
      plasma5.enable = true;

      xterm.enable = false;
    };

    displayManager.sddm.enable = true;

    enable = true;

    libinput.enable = true;
  };
}
