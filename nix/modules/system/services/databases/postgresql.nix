{
  pkgs,
  lib,
  config,
  user,
  ...
}:
let
  cfg = config.modules.system.services.databases.postgresql;
in
{
  options.modules.system.services.databases.postgresql = {
    enable = lib.mkEnableOption "postgresql";
  };

  config = lib.mkIf cfg.enable {
    services.postgresql = {
      enable = true;
      package = pkgs.postgresql_16;
      ensureDatabases = [ user ];
      ensureUsers = [
        {
          name = user;
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
}
