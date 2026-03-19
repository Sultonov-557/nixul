{ lib, pkgs, ... }:
{
  metadata = {
    name = "hurl";
    description = "Module for `dev.tools.http.client.hurl`.";
    purpose = "Configure `dev.tools.http.client.hurl` features and defaults.";
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
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ hurl ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable hurl";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
