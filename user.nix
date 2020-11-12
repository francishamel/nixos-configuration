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

          font.size = 8.0;

          window = {
            dynamic_title = false;
            startup_mode = "Maximized";
            title = "Alacritty";
          };
        };
      };

      direnv = {
        enable = true;
        enableNixDirenvIntegration = true;
      };

      firefox.enable = true;

      git = {
        enable = true;
        userEmail = "francishamel96@gmail.com";
        userName = "Francis Hamel";

        extraConfig = {
          core.editor = "code --wait";
          pull.rebase = true;
          rebase.autoStash = true;
        };
      };

      htop = {
        enable = true;
        enableMouse = true;
        treeView = true;
      };

      vscode = {
        enable = true;

        extensions = (with pkgs.vscode-extensions; [
          bbenoist.Nix
          ms-azuretools.vscode-docker
        ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "elixir-ls";
            publisher = "JakeBecker";
            version = "0.6.1";
            sha256 = "1rrbn4vyx033jcbgqhfpqjqahr3qljawljzal8j73kk0z12kqglf";
          }
          {
            name = "gitlens";
            publisher = "eamodio";
            version = "10.2.3";
            sha256 = "00pddp8jlmqmc9c50vwm6bnkwg9gvvfn8mvrz1l9fl1w88ia1nz0";
          }
          {
            name = "material-icon-theme";
            publisher = "PKief";
            version = "4.4.0";
            sha256 = "1m9mis59j9xnf1zvh67p5rhayaa9qxjiw9iw847nyl9vsy73w8ya";
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
          "editor.fontFamily" = "'Fira Code'";
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

        initExtra = ''
          prompt_context(){}
        '';

        oh-my-zsh = {
          enable = true;

          plugins = [ "sudo" ];

          theme = "agnoster";
        };

        shellAliases = {
          ll = "ls -la";
          ".." = "cd ..";
        };
      };
    };
  };
}
