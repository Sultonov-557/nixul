{ pkgs, ... }:

{
  # Services configuration for DankMaterial flavor

  # Display and desktop
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;

  # Power, devices, and file systems
  services = {
    upower.enable = true;
    devmon.enable = true;
    udisks2.enable = true;
    gvfs.enable = true;
  };

  # Polkit authentication agent
  systemd.user.services.polkit-agent = {
    description = "Polkit authentication agent";
    wantedBy = [ "graphical-session.target" ];
    serviceConfig.ExecStart = "${pkgs.lxqt.lxqt-policykit}/bin/lxqt-policykit-agent";
  };

  # Syncthing for file synchronization
  services.syncthing = {
    enable = true;
    user = "sultonov";
    dataDir = "/home/sultonov/sync";
    configDir = "/home/sultonov/.config/syncthing";
  };

  # Virtualization
  virtualisation = {
    libvirtd.enable = true;
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
    };
  };

  # PostgreSQL database
  services.postgresql = {
    enable = true;
    ensureDatabases = [ "postgres" ];

    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser   origin         auth-method
      local all       postgres                peer
      host  all       all      127.0.0.1/32   md5
      host  all       all      ::1/32         md5
    '';
  };

  # Redis cache
  services.redis.servers."redis" = {
    enable = true;
    port = 6379;
  };

  # Security
  security = {
    rtkit.enable = true;
    pam.services = {
      astal-auth = { };
      greetd = {
        gnupg.enable = true;
        enableGnomeKeyring = true;
      };
      login = {
        enableGnomeKeyring = true;
        gnupg = {
          enable = true;
          noAutostart = true;
          storeOnly = true;
        };
      };
    };
    polkit.enable = true;
  };
}
