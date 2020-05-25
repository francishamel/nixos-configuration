{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    interactiveShellInit = ''
      eval "$(direnv hook zsh)"

      if [ -n "''${commands[fzf-share]}" ]; then
        source "$(fzf-share)/key-bindings.zsh"
      fi
    '';

    ohMyZsh = {
      enable = true;

      plugins = [ "docker" "git" "sudo" ];

      theme = "agnoster";
    };
  };

  users.defaultUserShell = pkgs.zsh;
}
