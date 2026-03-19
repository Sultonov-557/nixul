{ lib, ... }:
{
  metadata = {
    name = "khal";
    description = "Module for `apps.user.productivity.khal`.";
    purpose = "Configure `apps.user.productivity.khal` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "apps"
      "user"
      "productivity"
      "khal"
    ];
  };

  home =
    { cfg, ... }:
    {
      programs.khal = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable khal";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
