{ lib, config, ... }:
let
  mkBookmarks = import ../../../nixul/universal/bookmarks/adapters/glance/default.nix {
    inherit lib;
  };
in
{
  system =
    { cfg, nixul, ... }:
    {
      services.glance = lib.mkIf cfg.enable {
        enable = true;
        settings.pages = [
          {
            name = "Home";
            hide-desktop-navigation = false;
            columns = [
              {
                size = "small";
                widgets = [
                  {
                    type = "clock";
                    hour-format = "24h";
                  }
                  {
                    type = "calendar";
                    first-day-of-week = "monday";
                  }
                  {
                    type = "weather";
                    location = cfg.location or nixul.host.location or "The Moon";
                  }
                ];
              }
              {
                size = "full";
                widgets = [
                  {
                    type = "search";
                    search-engine = "google";
                  }
                  {
                    type = "group";
                    widgets = [
                      {
                        type = "bookmarks";
                        title = "Bookmarks";
                        groups = mkBookmarks config.nixul.host.bookmarks;
                      }
                    ];
                  }
                  {
                    type = "server-stats";
                    services = [
                      {
                        type = "local";
                        name = "System";
                      }
                    ];
                  }
                ];
              }
              {
                size = "small";
                widgets = [
                  {
                    type = "releases";
                    show-source-icon = true;
                    repositories = [
                      "NixOS/nixpkgs"
                      "nix-community/home-manager"
                      "niri-wm/niri"
                      "hyprwm/Hyprland"
                      "AvengeMedia/DankMaterialShell"
                      "noctalia-dev/noctalia-shell"
                    ];
                  }
                  {
                    type = "dns-stats";
                    service = "adguard";
                    url = "http://adguard.home";
                  }
                  {
                    type = "monitor";
                    cache = "1m";
                    title = "Services";
                    sites = [

                    ]
                    ++ (
                      if nixul.host.modules.core.security.network.adguardhome.enable then
                        [
                          {
                            title = "AdGuard";
                            url = "http://adguard.home";
                          }
                        ]
                      else
                        [ ]
                    );
                  }
                ];
              }
            ];
          }
        ];
      };

      services.nginx.virtualHosts.glance =
        lib.mkIf (cfg.enable && config.nixul.host.modules.services.server.nginx.enable)
          {
            serverName = "glance.home";
            locations."/" = {
              proxyPass = "http://127.0.0.1:8080";
            };
          };

      services.unbound.settings.server.local-data =
        lib.mkIf (cfg.enable && config.nixul.host.modules.core.security.network.unbound.enable)
          [
            ''"glance.home. A 127.0.0.1"''
          ];

      assertions = [
        {
          assertion = (!cfg.enable) || config.nixul.host.modules.services.server.nginx.enable;
          message = "services.monitoring.glance requires services.server.nginx.enable = true";
        }
        {
          assertion = (!cfg.enable) || config.nixul.host.modules.core.security.network.unbound.enable;
          message = "services.monitoring.glance requires core.security.network.unbound.enable = true";
        }
      ];
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable glance";
        };
        location = lib.mkOption {
          type = lib.types.str;
          default = null;
          description = "Location";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
