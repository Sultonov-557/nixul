{ lib, pkgs, ... }:
{
  metadata = {
    name = "bruno";
    description = "Module for `dev.tools.http.client.bruno`.";
    purpose = "Configure `dev.tools.http.client.bruno` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "tools"
      "http"
      "client"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ bruno ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable bruno";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
