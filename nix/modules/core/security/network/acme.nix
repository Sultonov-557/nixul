{ lib, ... }:
{
  system =
    { cfg, config, ... }:
    {
      security.acme = lib.mkIf cfg.enable {
        acceptTerms = true;
        defaults = {
          email = config.nixul.users.${config.nixul.primaryUser}.email;
          dnsResolver = "1.1.1.1";
        };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable acme";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
