{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      services.fail2ban = lib.mkIf cfg.enable {
        enable = true;
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable fail2ban";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
