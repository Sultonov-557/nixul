{ lib, pkgs, ... }:
{
  metadata = {
    name = "prisma";
    description = "Module for `dev.runtimes.javascript.prisma`.";
    purpose = "Configure `dev.runtimes.javascript.prisma` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "runtimes"
      "javascript"
      "prisma"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [
        prisma
        prisma-engines
      ]);
      environment.variables = lib.mkIf cfg.enable {
        PRISMA_QUERY_ENGINE_LIBRARY = "${pkgs.prisma-engines}/lib/libquery_engine.node";
        PRISMA_QUERY_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/query-engine";
        PRISMA_SCHEMA_ENGINE_BINARY = "${pkgs.prisma-engines}/bin/schema-engine";
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable prisma";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
