{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    ohMyZsh = {
      enable = true;

      plugins = [
        "docker"
        "git"
      ];

      theme = "agnoster";
    };
  };

  users.defaultUserShell = pkgs.zsh;
}