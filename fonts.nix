{ pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    emacs-all-the-icons-fonts
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    noto-fonts-emoji
  ];
}
