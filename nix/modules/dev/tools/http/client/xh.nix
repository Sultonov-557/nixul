{ lib, pkgs, ... }:
{
  metadata = {
    name = "xh";
    description = "Module for `dev.tools.http.client.xh`.";
    purpose = "Configure `dev.tools.http.client.xh` features and defaults.";
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
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ xh ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable xh";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
