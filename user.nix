{ pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];

  users = {
    users.francis = {
      createHome = true;

      extraGroups = [ "audio" "video" "wheel" ];

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

      # Apps
      discord
      slack
      spotify
      teams

      # Dev tools
      docker-compose
      dive
      niv
      nixfmt
      openconnect

      # Utilities
      unrar
      unzip
      zip

      # KDE apps
      gwenview
      kcalc
      okteta
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

          env.TERM = "alacritty";

          font.size = 10.0;

          window = {
            dynamic_title = false;
            startup_mode = "Maximized";
            title = "Alacritty";
          };
        };
      };

      bat = {
        enable = true;

        themes = {
          solarized = builtins.readFile (pkgs.fetchFromGitHub {
            owner = "braver";
            repo = "Solarized";
            rev = "87e01090cf5fb821a234265b3138426ae84900e7";
            sha256 = "01q2hn7rwccjcpgxl3xl7qrfrryhajmlkfv3mci6fbdgxnpvrg5w";
          } + "/Solarized (dark).tmTheme");
        };
      };

      dircolors.enable = true;

      direnv = {
        enable = true;
        enableNixDirenvIntegration = true;
      };

      firefox.enable = true;

      git = {
        aliases = {
          co = "checkout";
          cob = "co -b";
          f = "fetch --prune";
        };

        enable = true;

        extraConfig = {
          core.editor = "code --wait";
          init.defaultBranch = "main";
          pull.rebase = true;
          rebase.autoStash = true;
        };

        userEmail = "francishamel96@gmail.com";
        userName = "Francis Hamel";
      };

      home-manager.enable = true;

      htop = {
        enable = true;

        settings = {
          enableMouse = true;
          treeView = true;
        };
      };

      jq.enable = true;

      lsd.enable = true;

      starship.enable = true;

      vscode = {
        enable = true;

        extensions = (with pkgs.vscode-extensions; [
          bbenoist.Nix
          ms-azuretools.vscode-docker
          ms-python.python
        ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "elixir-ls";
            publisher = "JakeBecker";
            version = "0.6.5";
            sha256 = "1j7qh0yah9an1s6316ylrx5mkxa1qx573nxddklwkf4xcf4nbfp0";
          }
          {
            name = "gitlens";
            publisher = "eamodio";
            version = "11.0.6";
            sha256 = "0qlaq7hn3m73rx9bmbzz3rc7khg0kw948z2j4rd8gdmmryy217yw";
          }
          {
            name = "material-icon-theme";
            publisher = "PKief";
            version = "4.5.0";
            sha256 = "1mp069j9262ds7f9rx05lhvm85072bx4lyj5nicplmjwwwhf6jwl";
          }
          {
            name = "nixfmt-vscode";
            publisher = "brettm12345";
            version = "0.0.1";
            sha256 = "07w35c69vk1l6vipnq3qfack36qcszqxn8j3v332bl0w6m02aa7k";
          }
        ];

        userSettings = {
          "diffEditor.ignoreTrimWhitespace" = false;
          "editor.fontFamily" = "'FiraCode Nerd Font'";
          "editor.fontLigatures" = true;
          "editor.minimap.enabled" = false;
          "editor.tabSize" = 2;
          "elixirLS.dialyzerEnabled" = false;
          "elixirLS.fetchDeps" = false;
          "extensions.autoUpdate" = false;
          "files.insertFinalNewline" = true;
          "git.confirmSync" = false;
          "telemetry.enableCrashReporter" = false;
          "telemetry.enableTelemetry" = false;
          "workbench.colorTheme" = "Solarized Dark";
          "workbench.iconTheme" = "material-icon-theme";
        };
      };

      zsh = {
        dotDir = ".config/zsh";

        enable = true;

        oh-my-zsh = {
          enable = true;

          plugins = [ "sudo" ];
        };

        shellAliases = {
          ls = "lsd";
          ll = "ls -la";
          ".." = "cd ..";
          edit-config = "code /etc/nixos";
          rebuild-config = "sudo nixos-rebuild switch";

          # Safety nets
          cp = "cp -i";
          mv = "mv -i";
          rm = "rm -I --preserve-root";
        };
      };
    };
  };
}
