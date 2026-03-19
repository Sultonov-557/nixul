{ lib, pkgs, ... }:
{
  metadata = {
    name = "whatweb";
    description = "Module for `dev.security.recon.web.whatweb`.";
    purpose = "Configure `dev.security.recon.web.whatweb` features and defaults.";
    scope = "system";
    status = "active";
    tags = [
      "dev"
      "security"
      "recon"
      "web"
    ];
  };

  system =
    { cfg, ... }:
    {
      environment.defaultPackages = lib.mkIf cfg.enable (with pkgs; [ whatweb ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable whatweb";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
