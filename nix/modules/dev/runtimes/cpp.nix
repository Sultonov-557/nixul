{ lib, pkgs, ... }:
{
  metadata = {
    name = "cpp";
    description = "Module for `dev.runtimes.cpp`.";
    purpose = "Configure `dev.runtimes.cpp` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "runtimes"
      "cpp"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ gcc ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable cpp";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
