{ lib, config, ... }:
let
  mkBookmarks = import ../../../nixul/universal/bookmarks/adapters/glance/default.nix {
    inherit lib;
  };
in
{
  system =
    { cfg, nixul, ... }:
    let
      adguardEnabled = lib.attrByPath [
        "host"
        "modules"
        "core"
        "security"
        "network"
        "adguardhome"
        "enable"
      ] false nixul;
      liteLLMEnabled = lib.attrByPath [
        "host"
        "modules"
        "services"
        "ai"
        "litellm"
        "enable"
      ] false nixul;
      openWebUIEnabled = lib.attrByPath [
        "host"
        "modules"
        "services"
        "ai"
        "open-webui"
        "enable"
      ] false nixul;
      vaultwardenEnabled = lib.attrByPath [
        "host"
        "modules"
        "services"
        "server"
        "vaultwarden"
        "enable"
      ] false nixul;
      uptimeEnabled = lib.attrByPath [
        "host"
        "modules"
        "services"
        "monitoring"
        "uptime-kuma"
        "enable"
      ] false nixul;

      nginxEnabled = lib.attrByPath [
        "host"
        "modules"
        "services"
        "server"
        "nginx"
        "enable"
      ] false nixul;
      unboundEnabled = lib.attrByPath [
        "host"
        "modules"
        "core"
        "security"
        "network"
        "unbound"
        "enable"
      ] false nixul;
    in
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
                    location = nixul.host.location;
                  }
                ];
              }
              {
                size = "full";
                widgets = [
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
                  {
                    type = "rss";
                    title = "CVEs";
                    feeds = [
                      {
                        title = "Critical CVEs";
                        url = "https://cvedaily.com/feed-critical.xml";
                      }
                      {
                        title = "CISA Exploited CVEs";
                        url = "https://www.cisa.gov/sites/default/files/feeds/known_exploited_vulnerabilities.json";
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
                      "anomalyco/opencode"
                      "hyprwm/Hyprland"
                      "AvengeMedia/DankMaterialShell"
                      "noctalia-dev/noctalia-shell"
                      "niri-wm/niri"
                      "nixos/nixpkgs"
                      "nix-community/home-manager"
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
                      if adguardEnabled then
                        [
                          {
                            title = "AdGuard";
                            url = "http://adguard.home";
                          }
                        ]
                      else
                        [ ]
                    )
                    ++ (
                      if liteLLMEnabled then
                        [
                          {
                            title = "LiteLLM";
                            url = "http://litellm.home";
                          }
                        ]
                      else
                        [ ]
                    )
                    ++ (
                      if openWebUIEnabled then
                        [
                          {
                            title = "Open Web UI";
                            url = "http://open-webui.home";
                          }
                        ]
                      else
                        [ ]
                    )
                    ++ (
                      if vaultwardenEnabled then
                        [
                          {
                            title = "Vaultwarden";
                            url = "http://vault.home";
                          }
                        ]
                      else
                        [ ]
                    )
                    ++ (
                      if uptimeEnabled then
                        [
                          {
                            title = "Uptime";
                            url = "http://uptime.home";
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

      services.nginx.virtualHosts.glance = lib.mkIf (cfg.enable && nginxEnabled) {
        serverName = "glance.home";
        addSSL = true;
        sslCertificate = "/var/lib/internal-ca/certs/home-wildcard.crt";
        sslCertificateKey = "/var/lib/internal-ca/private/home-wildcard.key";
        locations."/" = {
          proxyPass = "http://127.0.0.1:8080";
        };
      };

      services.unbound.settings.server.local-data = lib.mkIf (cfg.enable && unboundEnabled) [
        ''"glance.home. A 127.0.0.1"''
      ];

      assertions = [
        {
          assertion = (!cfg.enable) || nginxEnabled;
          message = "services.monitoring.glance requires services.server.nginx.enable = true";
        }
        {
          assertion = (!cfg.enable) || unboundEnabled;
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
      };
    };
    default = {
      enable = false;
    };
  };
}
