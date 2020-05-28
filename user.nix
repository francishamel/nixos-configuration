{ pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];

  users = {
    users.francis = {
      createHome = true;

      extraGroups = [ "audio" "networkmanager" "video" "wheel" ];

      isNormalUser = true;

      password = "";

      shell = pkgs.zsh;

      uid = 1000;
    };

    mutableUsers = false;
  };

  home-manager.users.francis = {
    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [
      # Pentest tools
      burpsuite
      gobuster
      nmap

      # Communication
      discord
      slack

      # Dev tools
      nixfmt

      # KDE apps
      kcalc
      gwenview
      okular
      spectacle
    ];

    programs = {
      alacritty = {
        enable = true;

        settings = {
          colors = {
            primary = {
              background = "#002b36";
              foreground = "#839496";
            };

            cursor = {
              text = "#002b36";
              cursor = "#839496";
            };

            normal = {
              black = "#073642";
              red = "#dc322f";
              green = "#859900";
              yellow = "#b58900";
              blue = "#268bd2";
              magenta = "#d33682";
              cyan = "#2aa198";
              white = "#eee8d5";
            };

            bright = {
              black = "#586e75";
              red = "#cb4b16";
              green = "#586e75";
              yellow = "#657b83";
              blue = "#839496";
              magenta = "#6c71c4";
              cyan = "#93a1a1";
              white = "#fdf6e3";
            };
          };

          dynamic_title = false;

          env.TERM = "alacritty";

          font.size = 8.0;

          window = {
            startup_mode = "Maximized";
            title = "Alacritty";
          };
        };
      };

      firefox.enable = true;

      git = {
        enable = true;

        userEmail = "francishamel96@gmail.com";

        userName = "Francis Hamel";
      };

      vscode = {
        enable = true;

        userSettings = {
          "editor.minimap.enabled" = false;
          "editor.tabSize" = 2;
          "telemetry.enableCrashReporter" = false;
          "telemetry.enableTelemetry" = false;
          "workbench.colorTheme" = "Solarized Dark";
        };
      };

      zsh = {
        dotDir = ".config/zsh";

        enable = true;

        initExtra = "prompt_context(){}";

        oh-my-zsh = {
          enable = true;

          plugins = [ "docker" "git" "sudo" ];

          theme = "agnoster";
        };
      };
    };

    services = {
      redshift = {
        enable = true;

        provider = "geoclue2";
      };
    };
  };
}
