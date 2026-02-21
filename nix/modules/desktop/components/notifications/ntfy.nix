{ lib, ... }:
{
  system =
    { cfg, ... }:
    {
      services.ntfy-sh = lib.mkIf cfg.enable {
        enable = true;
        settings = {
          base-url = "http://ntfy.sh";
        };
      };
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable ntfy";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
