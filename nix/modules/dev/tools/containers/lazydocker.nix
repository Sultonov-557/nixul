{ lib, ... }:
{
  metadata = {
    name = "lazydocker";
    description = "Module for `dev.tools.containers.lazydocker`.";
    purpose = "Configure `dev.tools.containers.lazydocker` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "dev"
      "tools"
      "containers"
      "lazydocker"
    ];
  };

  home =
    { cfg, ... }:
    {
      programs.lazydocker = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable lazydocker";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
