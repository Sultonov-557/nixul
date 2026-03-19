{ pkgs, lib, ... }:
{
  metadata = {
    name = "nmap";
    description = "Module for `dev.security.scanning.network.nmap`.";
    purpose = "Configure `dev.security.scanning.network.nmap` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "dev"
      "security"
      "scanning"
      "network"
    ];
  };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (
        with pkgs;
        [
          nmap
          zenmap
        ]
      );
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable nmap";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
