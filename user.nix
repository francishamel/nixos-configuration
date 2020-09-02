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
      direnv
      niv
      nixfmt

      # Utilities
      htop
      unrar
      unzip
      zip

      # KDE apps
      gwenview
      kcalc
      kdeApplications.okteta
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

        extraConfig = {
          core.editor = "code --wait";
          pull.rebase = true;
          rebase.autoStash = true;
        };
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
            version = "0.4.0";
            sha256 = "070yfwwdrjkij4g3zhdryfzmsq75yf3pxrp4r7nxxavywh485859";
          }
          {
            name = "gitlens";
            publisher = "eamodio";
            version = "10.2.1";
            sha256 = "1bh6ws20yi757b4im5aa6zcjmsgdqxvr1rg86kfa638cd5ad1f97";
          }
          {
            name = "material-icon-theme";
            publisher = "PKief";
            version = "4.1.0";
            sha256 = "00alw214i2iibaqrm1njvb13bb41z3rvgy1akyq8fxvz35vq5a2s";
          }
          {
            name = "nixfmt-vscode";
            publisher = "brettm12345";
            version = "0.0.1";
            sha256 = "07w35c69vk1l6vipnq3qfack36qcszqxn8j3v332bl0w6m02aa7k";
          }
          {
            name = "foam-vscode";
            publisher = "foam";
            version = "0.1.7";
            sha256 = "0rrxfxmkf0szjmgc1dxhca1zgr0jnjmyinjm19i6ja82hpxzam01";
          }
          {
            name = "vscode-markdown-notes";
            publisher = "kortina";
            version = "0.0.10";
            sha256 = "0p639ahfaff3v1c1kqw6kd797q9yds98a534yjq0fbgpzc3w88q8";
          }
          {
            name = "markdown-links";
            publisher = "tchayen";
            version = "0.6.0";
            sha256 = "178l8da0yg53lw47kbxb100qwxzp3pvks7riw1i6ki9gm78zpfds";
          }
          {
            name = "markdown-all-in-one";
            publisher = "yzhang";
            version = "3.1.0";
            sha256 = "0b5fqwaxbdqpqx53gxjjfawghwrpbj9zmbvsw5wamn1jx3djgflk";
          }
        ];

        userSettings = {
          "editor.fontFamily" = "'Fira Code'";
          "editor.fontLigatures" = true;
          "editor.minimap.enabled" = false;
          "editor.tabSize" = 2;
          "elixirLS.dialyzerEnabled" = false;
          "elixirLS.fetchDeps" = false;
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
          eval "$(direnv hook zsh)"
        '';

        oh-my-zsh = {
          enable = true;

          plugins = [ "sudo" ];

          theme = "agnoster";
        };
      };
    };
  };
}
