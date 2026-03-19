{ lib, pkgs, ... }:
{
  metadata = {
    name = "litellm";
    description = "OpenAI-compatible gateway for routing and managing LLM providers.";
    purpose = "Run a self-hosted LLM proxy with auth, routing, and observability support.";
    scope = "system";
    tags = [
      "ai"
      "llm"
      "proxy"
      "gateway"
    ];
  };

  #TODO: delete workaround after https://github.com/NixOS/nixpkgs/issues/432925 is resolved
  system =
    let
      version = "1.80.10";

      prismaEngines = pkgs.prisma-engines_6;
      prismaCli = pkgs.prisma_6;
      py = pkgs.python3;

      prismaPatched = pkgs.python3Packages.prisma.overridePythonAttrs (old: {
        src = pkgs.fetchFromGitHub {
          owner = "kkkykin";
          repo = "prisma-client-py";
          rev = "e3d23804414e974558f0035e7faace61bea56cf2";
          hash = "sha256-9/uexdgYsv2S1IRh2SzeV3AO1SEBGPTbKspsEJHPEmw=";
        };
      });

      litellm-otel = py.withPackages (
        ps: with ps; [
          prismaPatched
          ps.opentelemetry-api
          ps.opentelemetry-sdk
          ps.opentelemetry-exporter-otlp

          (ps.litellm.overridePythonAttrs (old: {
            version = version;
            src = pkgs.fetchFromGitHub {
              owner = "BerriAI";
              repo = "litellm";
              rev = "v${version}.rc.5";
              hash = "sha256-lVNRjDgG+yZR4HfEUnmY1nO1WiukR9aYSBpn0M1JHBc=";
            };

            patches = (old.patches or [ ]) ++ [
              ../../../assets/patch/litellm/0001-fix-proxy-migration-ensure-writable.patch
            ];

            nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [
              prismaCli
              prismaEngines
              pkgs.nodejs
              prismaPatched
              pkgs.python3Packages.pythonRelaxDepsHook
            ];
            pythonRelaxDeps = (old.pythonRelaxDeps or [ ]) ++ [ "grpcio" ];

            postPatch = (old.postPatch or "") + ''
              substituteInPlace litellm/proxy/schema.prisma \
                --replace-fail '  provider = "prisma-client-py"' \
                $'  provider = "prisma-client-py"\n  output = "../../prisma"'
            '';

            postInstall = (old.postInstall or "") + ''
              (
                set -eo pipefail
                export HOME="$TMPDIR"
                export PATH=${prismaPatched}/bin:$PATH

                # make prisma-python + engines consistent
                export PRISMA_VERSION="6.19.1"
                export PRISMA_EXPECTED_ENGINE_VERSION="c2990dca591cba766e3b7ef5d9e8a84796e47ab7"
                export PRISMA_QUERY_ENGINE_BINARY="${prismaEngines}/bin/query-engine"
                export PRISMA_MIGRATION_ENGINE_BINARY="${prismaEngines}/bin/migration-engine"
                export PRISMA_INTROSPECTION_ENGINE_BINARY="${prismaEngines}/bin/introspection-engine"
                export PRISMA_FMT_BINARY="${prismaEngines}/bin/prisma-fmt"

                sp="$out/${ps.python.sitePackages}"
                schema="$sp/litellm/proxy/schema.prisma"

                # generate prisma python client into site-packages/prisma
                mkdir -p "$sp/prisma"
                chmod -R u+w "$sp" || true
                ${prismaCli}/bin/prisma generate --schema "$schema"

                # include litellm_proxy_extras module (repo top-level)
                extras_src="$(find "$NIX_BUILD_TOP" -maxdepth 5 -type d -name litellm_proxy_extras | head -n1 || true)"
                test -n "$extras_src" -a -d "$extras_src"
                cp -a "$extras_src" "$sp/"
              )
            '';

            propagatedBuildInputs =
              (old.propagatedBuildInputs or [ ])
              ++ (old.optional-dependencies.proxy or [ ])
              ++ [
                ps.grpcio
              ];
          }))
        ]
      );

    in
    {
      cfg,
      nixul,
      config,
      ...
    }:
    let
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
      sopsEnabled = lib.attrByPath [
        "host"
        "modules"
        "core"
        "security"
        "secrets"
        "sops"
        "enable"
      ] false nixul;
    in
    {
      systemd.tmpfiles.rules = lib.mkIf cfg.enable [
        "d /etc/litellm 0750 ${nixul.primaryUser} litellm -"
      ];

      users.groups.litellm = lib.mkIf cfg.enable { };
      users.users.litellm = lib.mkIf cfg.enable {
        isSystemUser = true;
        group = "litellm";
        home = "/var/lib/litellm";
        createHome = true;
      };

      sops.secrets = lib.mkIf (cfg.enable && sopsEnabled) {
        litellm-api-keys = {
          sopsFile = ../../../assets/secrets/api_keys.env;
          format = "dotenv";
          owner = "litellm";
          group = "litellm";
        };

        litellm-password = {
          sopsFile = ../../../assets/secrets/password.yaml;
          key = "password";
          owner = "litellm";
          group = "litellm";
        };
      };

      sops.templates.litellm-runtime-env = lib.mkIf (cfg.enable && sopsEnabled) {
        owner = "litellm";
        group = "litellm";
        content = ''
          UI_PASSWORD=${config.sops.placeholder."litellm-password"}
          LITELLM_MASTER_KEY=${config.sops.placeholder."litellm-password"}
          DATABASE_URL=postgresql://postgres:${config.sops.placeholder."litellm-password"}@localhost:5432/litellm
        '';
      };

      systemd.services.litellm = lib.mkIf cfg.enable {
        path = [
          prismaCli
          prismaEngines
          pkgs.nodejs
          pkgs.openssl
        ];
        serviceConfig =
          let
            settingsFormat = pkgs.formats.yaml { };
            configFile = settingsFormat.generate "config.yaml" config.services.litellm.settings;
          in
          {
            ExecStart = lib.mkForce "${litellm-otel}/bin/litellm --host \"${config.services.litellm.host}\" --port ${toString config.services.litellm.port} --config ${configFile}";
            User = "litellm";
            Group = "litellm";
            DynamicUser = lib.mkForce false;
            PrivateUsers = lib.mkForce false;
            EnvironmentFile = lib.optionals sopsEnabled [
              config.sops.secrets.litellm-api-keys.path
              config.sops.templates.litellm-runtime-env.path
            ];

            StateDirectory = [
              "litellm"
              "litellm/migrations"
            ];
            StateDirectoryMode = "0750";
            ReadWritePaths = [ "/var/lib/litellm" ];
          };
      };

      services.litellm = {
        enable = true;
        port = 9003;

        settings = {
          model_list = [
            {
              model_name = "main";
              litellm_params = {
                model = "openrouter/meta-llama/llama-3-70b-instruct";
              };
            }
            {
              model_name = "main";
              litellm_params = {
                model = "gemini/gemini-flash-latest";
              };
            }
            {
              model_name = "main";
              litellm_params = {
                model = "groq/openai/gpt-oss-120b";
              };
            }
          ];

          router_settings = {
            routing_strategy = "simple-shuffle";
            allowed_fails = 1;
            cooldown_time = 60 * 5;
          };
        };

        environment = {
          HOME = "/var/lib/litellm";
          PRISMA_HOME_DIR = "/var/lib/litellm";
          LITELLM_MIGRATION_DIR = "/var/lib/litellm/migrations";
          DOCS_URL = "/docs";
          ROOT_REDIRECT_URL = "/ui";
          UI_USERNAME = "admin";

          PRISMA_VERSION = "6.19.1";
          PRISMA_EXPECTED_ENGINE_VERSION = "c2990dca591cba766e3b7ef5d9e8a84796e47ab7";
          PRISMA_SCHEMA_ENGINE_BINARY = "${prismaEngines}/bin/schema-engine";
          PRISMA_QUERY_ENGINE_BINARY = "${prismaEngines}/bin/query-engine";
          PRISMA_QUERY_ENGINE_LIBRARY = "${prismaEngines}/lib/libquery_engine.node";
          PRISMA_MIGRATION_ENGINE_BINARY = "${prismaEngines}/bin/migration-engine";
          PRISMA_INTROSPECTION_ENGINE_BINARY = "${prismaEngines}/bin/introspection-engine";
          PRISMA_FMT_BINARY = "${prismaEngines}/bin/prisma-fmt";
        };
      };

      services.nginx.virtualHosts.litellm = lib.mkIf (cfg.enable && nginxEnabled) {
        serverName = "litellm.home";
        locations."/" = {
          proxyPass = "http://127.0.0.1:9003";
          proxyWebsockets = true;
        };
      };

      services.unbound.settings.server.local-data = lib.mkIf (cfg.enable && unboundEnabled) [
        ''"litellm.home. A 127.0.0.1"''
      ];

      assertions = [
        {
          assertion = (!cfg.enable) || nginxEnabled;
          message = "services.ai.litellm requires services.server.nginx.enable = true";
        }
        {
          assertion = (!cfg.enable) || unboundEnabled;
          message = "services.ai.litellm requires core.security.network.unbound.enable = true";
        }
        {
          assertion = (!cfg.enable) || sopsEnabled;
          message = "services.ai.litellm requires core.security.secrets.sops.enable = true";
        }
      ];
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable litellm";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
