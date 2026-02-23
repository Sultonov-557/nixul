{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./keybinds
  ];

  nixul = {
    user = "sultonov";
    email = "sultonovzerifboy@gmail.com";
    hostname = "nomad";
    timezone = "Asia/Tashkent";

    apps = {
      ai = {
        codex = true;
        opencode = true;
      };
      gaming = {
        compatibility = {
          wine = true;
        };
        games = {
          minecraft = true;
        };
        platform = {
          gamemode = true;
          gamescope = true;
        };
      };
      media = {
        audio = {
          pamixer = true;
          pavucontrol = true;
          playerctl = true;
          pulsemixer = true;
        };
        music = {
          yandex = true;
        };
        photo = {
          aseprite = true;
          gimp = true;
          lutgen = true;
        };
        video = {
          ffmpeg = true;
          mpv = true;
        };
      };
      system = {
        disk = {
          gparted = true;
        };
        files = {
          analyzers = {
            baobab = true;
            ncdu = true;
          };
          archives = {
            file-roller = true;
            p7zip = true;
            unzip = true;
            zip = true;
          };
          managers = {
            nautilus = true;
            yazi = true;
          };
        };
        monitors = {
          mission-center = true;
        };
        terminal = {
          ghostty = true;
        };
      };
      user = {
        internet = {
          browsers = {
            chrome = true;
            tor = true;
            zen-browser = true;
          };
          communication = {
            discord = true;
            telegram = true;
          };
          qbitttorrent = true;
        };
        productivity = {
          obsidian = true;
          libreoffice = true;
          khal = true;
        };
      };
    };

    core = {
      maintenance = {
        garbage-collector = true;
        auto-upgrade = true;
        journald = true;
      };
      security = {
        access = {
          polkit = true;
        };
        network = {
          acme = true;
          avahi = true;
          firewall = true;
          resolved = true;
          unbound = true;
        };
        secrets = {
          sops = true;
        };
        ssh = {
          openssh = true;
          ssh = true;
        };
        sysctl = true;
      };
      system = {
        boot = {
          grub = true;
        };
        desktop = {
          dbus = true;
          xdg = true;
        };
        identity = {
          locale = true;
          user = true;
        };
        nix = {
          documentation = true;
          nh = true;
          nix = true;
          nix-index = true;
          nix-ld = true;
        };
      };
      terminal = {
        shells = {
          fish = true;
        };
        tools = {
          display = {
            bat = true;
            eza = true;
          };
          history = {
            atuin = true;
            thefuck = true;
          };
          info = {
            fastfetch = true;
            lsof = true;
            tty-clock = true;
          };
          monitor = {
            btop = true;
            tcpdump = true;
          };
          navigation = {
            fzf = true;
            ripgrep = true;
            zoxide = true;
          };
          prompt = {
            starship = true;
          };
        };
      };
    };

    desktop = {
      components = {
        notifications = {
          mako = true;
          ntfy = true;
        };
        cliphist = true;
        polkit = true;
        screenshots = true;
      };
      display = {
        wayland = true;
        xserver = true;
      };
      display-manager = {
        gdm = true;
      };
      panels = {
        caelestia = false;
        noctalia = true;
      };
      theming = {
        stylix = true;
        themes = {
          gruvbox-material = true;
        };
      };
      wms = {
        hyprland = true;
      };
    };

    dev = {
      editor = {
        antigravity = true;
        nixvim = true;
      };
      git = {
        git = true;
        git-extras = true;
        github = true;
        lazygit = true;
      };
      multiplexers = {
        zellij = {
          zellij = true;
        };
      };
      runtimes = {
        cpp = true;
        javascript = {
          bun = true;
          nodejs = true;
          prisma = true;
          yarn = true;
        };
        python = true;
        rustc = true;
      };
      security = {
        analysis = {
          inetutils = true;
          metasploit = true;
          wireshark = true;
          caido = true;
        };
        brute-force = {
          hashcat = true;
          hydra = true;
          john = true;
          wordlists = true;
        };
        mitm = {
          ettercap = true;
        };
        scanning = {
          assetfinder = true;
          bettercap = true;
          nuclei = true;
          katana = true;
          netcat = true;
          nmap = true;
        };
        wireless = {
          wifite2 = true;
        };
      };
      tools = {
        containers = {
          lazydocker = true;
        };
        db = {
          dbeaver = true;
          usql = true;
        };
        env = {
          direnv = true;
        };
        http = {
          client = {
            bruno = true;
            simplehttp = true;
            xh = true;
            hurl = true;
          };
          server = {
            ngrok = true;
          };
        };
        quality = {
          biome = true;
          deadnix = true;
        };
      };
    };

    hardware = {
      audio = {
        pipewire = true;
        rtkit = true;
      };
      bluetooth = {
        blueman = true;
        bluetooth = true;
      };
      inputs = {
        qmk = true;
        via = true;
      };
      network = {
        networkmanager = true;
      };
      power = {
        brightnessctl = true;
        power-management = true;
        profiles = true;
        thermald = true;
        upower = true;
      };
      printing = {
        hplip = true;
        printing = true;
        sane = true;
      };
      units = {
        cpu = {
          intel = true;
        };
        gpu = {
          mesa = true;
          opengl = true;
        };
        ram = {
          zram = true;
        };
        storage = {
          udiskie = true;
          usb-automount = true;
        };
      };
    };

    services = {
      ai = {
        ollama = true;
        open-webui = true;
      };
      containers = {
        docker = true;
        kubernetes = {
          kind = false;
          kubectl = false;
          minikube = false;
        };
      };
      databases = {
        postgresql = true;
        redis = true;
      };
      monitoring = {
        dashy = true;
        glance = true;
      };
      server = {
        nginx = true;
      };
      vpn = {
        openvpn = true;
        tailscale = true;
        wireguard = true;
      };
    };

  };
}
