{ lib, pkgs, ... }:
{
  metadata = {
    name = "simplehttp";
    description = "Module for `dev.tools.http.client.simplehttp`.";
    purpose = "Configure `dev.tools.http.client.simplehttp` features and defaults.";
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
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ simplehttp2server ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable simplehttp";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
