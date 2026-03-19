{ lib, pkgs, ... }:
{
  metadata = {
    name = "wireshark";
    description = "Module for `dev.security.trafic.wireshark`.";
    purpose = "Configure `dev.security.trafic.wireshark` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "dev"
      "security"
      "trafic"
      "wireshark"
    ];
  };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (with pkgs; [ wireshark ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable wireshark";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
