{ pkgs, ... }:

{
  programs.zsh = {
    autosuggestions.enable = true;
    
    enable = true;

    ohMyZsh = {
      enable = true;

      plugins = [ "docker" "sudo" ];
    };
  };

  users.defaultUserShell = pkgs.zsh;
}