{ lib, pkgs, config, ... }:
{
  metadata = {
    name = "postgresql";
    description = "Module for `services.databases.postgresql`.";
    purpose = "Configure `services.databases.postgresql` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "services"
      "databases"
      "postgresql"
    ];
  };

  system =
    { cfg, ... }:
    {
      services.postgresql = lib.mkIf cfg.enable {
        enable = true;
        package = pkgs.postgresql_18;
        ensureDatabases = [ config.nixul.host.name ];
        ensureUsers = [
          {
            name = config.nixul.host.name;
            ensureDBOwnership = true;
          }
        ];
        authentication = pkgs.lib.mkOverride 10 ''
          local all all trust
          host all all 127.0.0.1/32 trust
          host all all ::1/128 trust
        '';
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable postgresql";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
