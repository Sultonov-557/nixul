{ lib, pkgs, ... }:
{
  metadata = {
    name = "wordlists";
    description = "Module for `dev.security.attack.brute-force.wordlists`.";
    purpose = "Configure `dev.security.attack.brute-force.wordlists` features and defaults.";
    scope = "home";
    status = "active";
    tags = [
      "dev"
      "security"
      "attack"
      "brute-force"
    ];
  };

  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (with pkgs; [ wordlists ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable wordlists";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
