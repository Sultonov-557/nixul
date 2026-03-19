{ lib, pkgs, ... }:
{
  metadata = {
    name = "ngrok";
    description = "Module for `dev.tools.http.server.ngrok`.";
    purpose = "Configure `dev.tools.http.server.ngrok` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "tools"
      "http"
      "server"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ ngrok ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable ngrok";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
