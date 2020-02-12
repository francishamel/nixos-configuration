{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    interactiveShellInit = ''
      eval "$(direnv hook zsh)"
    '';

    ohMyZsh = {
      enable = true;

      plugins = [
        "docker"
        "git"
        "sudo"
      ];

      theme = "agnoster";
    };
  };

  users.defaultUserShell = pkgs.zsh;
}